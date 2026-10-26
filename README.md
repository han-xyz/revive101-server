# revive101-server

Host a Wizard101 private server for friends with Docker Compose. It runs two services:

- A game-file server on port 12369, which Imlight reads the game's WADs from. It is one of:
  - `client-files` (profile `client-folder`, the default): serves a client you already have installed, read-only.
  - Aurorium (profile `mirror`): mirrors the game files from KingsIsle, about 19 GB.
- Imlight is the game server (login 12000, realm 12333, patch 12500).

`COMPOSE_PROFILES` in `.env` picks the game-file server.

This is not affiliated with or endorsed by KingsIsle. The game files stay on your machine.

## Prerequisites

- Docker with Compose v2.
- A Wizard101 client install and a WizType dump, to produce the generator inputs. [Imlight's generator-input guide](https://github.com/han-xyz/Imlight/blob/quality-assurance/deploy/generator-input/README.md) says how.
- With the `mirror` profile only: about 20 GB of free disk for the mirrored game files.

## First run

1. Clone this repo with its submodules, Aurorium and Imlight, at the branches named in `.gitmodules`. `--recurse-submodules` is required: Imlight has a submodule of its own (Imcodec) that its build needs.

   ```sh
   git clone --recurse-submodules https://github.com/han-xyz/revive101-server.git
   cd revive101-server
   ```

   To update the forks later, run both commands: the first moves each fork to its branch tip, the second moves Imlight's Imcodec to the commit Imlight pins.

   ```sh
   git submodule update --remote --merge
   git -C Imlight submodule update --init
   ```

2. Copy the generator inputs (the WizType JSON and the 29 `*Messages*.xml` files) into `Imlight/deploy/generator-input/` inside the submodule. The Imlight build fails without them.

   ```sh
   cp /path/to/your/generator-input/* Imlight/deploy/generator-input/
   ```

3. Create `.env` and fill in `ADMIN_PASSWORD`, `GAME_SERVER_IP` and, for the `client-folder` profile, `CLIENT_DIR`. Every variable is explained in `.env.example`. The password must not be empty or `compsci`, or Imlight exits at boot.

   ```sh
   cp .env.example .env
   ```

4. Build the images (a few minutes).

   ```sh
   docker compose build
   ```

5. Start the game-file server.

   With `client-folder`, the client in `CLIENT_DIR` must be at `GAME_REVISION`, and the revision's two file lists go in `client-files/lists/V_<GAME_REVISION>/`. A client doesn't keep them, so download them once; any Aurorium mirror of the revision serves them:

   ```sh
   mkdir -p client-files/lists/V_r806919.Wizard_1_610
   cd client-files/lists/V_r806919.Wizard_1_610
   curl -fO https://patcher.phill030.de/V_r806919.Wizard_1_610/LatestFileList.xml
   curl -fO https://patcher.phill030.de/V_r806919.Wizard_1_610/LatestFileList.bin
   cd -
   docker compose up -d client-files
   ```

   With `mirror`, Aurorium mirrors about 19 GB from KingsIsle on first start, which takes hours. It answers `/latest` with a revision only when the mirror is ready; do not start Imlight before then. `/latest` prints the revision with a `V_` prefix, which Imlight adds itself. If the value without it differs from `GAME_REVISION` in `.env`, set `GAME_REVISION` to it.

   ```sh
   docker compose up -d aurorium
   curl -s http://127.0.0.1:12369/latest | sed 's/^V_//'
   ```

6. Start Imlight and wait for two log lines: `Patch server at URL http://<GAME_SERVER_IP>:12369/V_<revision> found and set` and `Imlight may now be connected to.` Imlight checks the game-file server once at boot. If it logs `Patch server endpoint is not available! Continuing without patch server.`, fix reachability (see Network) and run `docker compose restart imlight`.

   ```sh
   docker compose up -d imlight
   docker compose logs -f imlight
   ```

7. Each player starts the client with your server's address.

   ```sh
   WizardGraphicalClient.exe -L <GAME_SERVER_IP> 12000
   ```

8. Create friend accounts. Log in with the admin account (`ADMIN_USERNAME`, `ADMIN_PASSWORD`), create a wizard, enter the world, and type in chat, per [Imlight's command list](https://github.com/han-xyz/Imlight/blob/quality-assurance/docs/docs/modules/imlight/commands.md):

    ```text
    .account create <user> <password>
    ```

## Admin panel

Staff accounts (auth level QualityAssurance or above) can manage accounts and Crowns from an in-game panel: open the settings window and click **Admin**, above Quit. It needs two things:

1. `ADMIN_PANEL_ENABLED=true` in `.env`, then `docker compose up -d imlight`.
2. The panel's client files on each staff PC. Close the game client, then run:

   ```sh
   python -I Imlight/tools/admin-panel/build.py --client "<game client folder>" --install
   ```

   This adds the panel to the client's `Data/GameData/Root.wad` and keeps the original as `Data/Root.wad.adminpanel-original`; `--uninstall` restores it. A client update replaces `Root.wad`, so install again after patching. Players who aren't staff need nothing.

[Imlight's admin panel notes](https://github.com/han-xyz/Imlight/blob/feat/admin-panel/tools/admin-panel/README.md) say what each action needs.

## Network

On a LAN the setup works as is: set `GAME_SERVER_IP` to the host's LAN address. Imlight, and any client that patches, downloads game files from `http://<GAME_SERVER_IP>:12369`, so that port must be reachable at that address, from the Imlight container too. `AURORIUM_BIND` may be narrowed to the `GAME_SERVER_IP` address (for example the VPN IP); any other value breaks patching.

If Imlight logs that the patch server is not available, a host firewall that denies incoming traffic by default (ufw, firewalld) is the usual cause: allow the compose bridge to reach port 12369 on the host, for example `ufw allow in on br-+ to any port 12369 proto tcp`.

For friends over the internet, put everyone on a VPN (Tailscale or WireGuard) and set `GAME_SERVER_IP` to the host's VPN address. On a Windows host with Tailscale, right-click `Enable-TailscaleFirewall.cmd` and choose **Run as administrator**: it allows TCP 12000, 12333, 12369 and 12500 in from Tailscale addresses on the Tailscale interface only. Do not port-forward the server to the internet: once a player is attached the server trusts them with its session, and more security fixes are pending.

## Data pack

Imlight reads its game data from a git repository, `SPIRALDB_URL`. To change it:

1. Fork the spiraldb repository and set `SPIRALDB_URL` in `.env` to your fork.
2. Edit your checkout of the fork with Imview, then commit and push.
3. Restart Imlight, which fetches the pack on boot.

   ```sh
   docker compose restart imlight
   ```
