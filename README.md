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

   On Windows, `Start-Client-Local.cmd` does this from the client in `CLIENT_DIR`, or in a standard install location, after checking the server answers.

8. Create friend accounts from the [server console](#server-console):

    ```sh
    docker compose exec imlight dotnet Imlight.Director.dll console account create <user> <password>
    ```

    Or log in with the admin account (`ADMIN_USERNAME`, `ADMIN_PASSWORD`), create a wizard, enter the world, and type in chat, per [Imlight's command list](https://github.com/han-xyz/Imlight/blob/quality-assurance/docs/docs/modules/imlight/commands.md):

    ```text
    .account create <user> <password>
    ```

## Server console

Imlight takes staff account commands in a terminal, with no game client or character. They act as the admin account (`ADMIN_USERNAME`), and every change goes to the admin audit log, as the panel's do. Run one command, or leave the command out for an interactive console:

```sh
docker compose exec imlight dotnet Imlight.Director.dll console account list
docker compose exec imlight dotnet Imlight.Director.dll console
```

| Command | Does |
| --- | --- |
| `account list` | Lists every account. |
| `account info <user>` | Shows an account. |
| `account create <user> <password> [level]` | Creates an account, optionally with an auth level. |
| `account password <user> <password>` | Changes a password. `ADMIN_PASSWORD` applies only when the admin account is first created, so change it here later. |
| `account level <user> <level>` | Changes an auth level: `None`, `QualityAssurance`, `HallMonitor`, `Developer` or `Administrator`. |
| `account lock <user>` / `account unlock <user>` | Stops an account from logging in, or lets it again. |
| `crowns <user> [change]` | Shows an account's Crowns, or adds (`500`) or takes away (`-500`). |

Passwords cannot contain spaces. A password given on the command line stays in your shell history; type it in the interactive console to avoid that.

## Admin panel

Staff accounts (auth level QualityAssurance or above) can do everything the chat commands do from an in-game panel: open the settings window and click **Admin**, above Quit. Type a username above the tabs to load an account; its characters show as heads down the left side, and the character tabs act on the one you click, whether its player is online or not. Each tab lists only the actions your auth level allows. It needs two things:

1. `ADMIN_PANEL_ENABLED=true` in `.env`, then `docker compose up -d imlight`.
2. The panel's client files on each staff PC. Close the game client, then run:

   ```sh
   python -I Imlight/tools/admin-panel/build.py --client "<game client folder>" --install
   ```

   This adds the panel to the client's `Data/GameData/Root.wad` and keeps the original as `Data/Root.wad.adminpanel-original`; `--uninstall` restores it. A client update replaces `Root.wad`, so install again after patching, and after updating Imlight. Players who aren't staff need nothing.

[Imlight's admin panel notes](https://github.com/han-xyz/Imlight/blob/feat/admin-panel/tools/admin-panel/README.md) say what each action needs.

## Chat filter

The game client filters chat itself; the server only tells it which kind of chat each player has. `CHAT_FILTER_ENABLED=true` in `.env` gives players below HallMonitor filtered chat, where only words from the game's dictionary get through. Staff keep open chat. Players get the change at their next login.

Open chat still masks the client's banned words. To turn them off, each player runs this on their own PC with the game client closed (`--on` undoes it):

```sh
python -I Imlight/tools/chat-filter/banned_words.py --client "<game client folder>" --off
```

Installing the admin panel or patching the client turns them back on, so run it again afterwards. [`Imlight/tools/chat-filter/README.md`](Imlight/tools/chat-filter/README.md) lists the client's filter files.

## Network

On a LAN the setup works as is: set `GAME_SERVER_IP` to the host's LAN address. Imlight, and any client that patches, downloads game files from `http://<GAME_SERVER_IP>:12369`, so that port must be reachable at that address, from the Imlight container too. `AURORIUM_BIND` may be narrowed to the `GAME_SERVER_IP` address (for example the VPN IP); any other value breaks patching.

If Imlight logs that the patch server is not available, a host firewall that denies incoming traffic by default (ufw, firewalld) is the usual cause: allow the compose bridge to reach port 12369 on the host, for example `ufw allow in on br-+ to any port 12369 proto tcp`.

For friends over the internet, put everyone on a VPN (Tailscale or WireGuard) and set `GAME_SERVER_IP` to the host's VPN address. On a Windows host with Tailscale, right-click `Enable-TailscaleFirewall.cmd` and choose **Run as administrator**: it allows TCP 12000, 12333, 12369 and 12500 in from Tailscale addresses on the Tailscale interface only. Do not port-forward the server to the internet: once a player is attached the server trusts them with its session, and more security fixes are pending.

## Fly.io

[`fly/imlight/`](fly/imlight/) runs Imlight on Fly.io on a public IPv4. The machine stops when nobody is connected and starts on the next connection, so you pay for compute only while it runs; the volume and IP are billed all month. The app is public, so access control is up to you.

Game files come from a public Aurorium mirror, `https://patcher.phill030.de`, set in `fly/imlight/fly.toml`. Imlight downloads the ones it reads into its cache on the volume, and players who patch download from the mirror. To self-host them, deploy [`fly/aurorium/`](fly/aurorium/) the same way and point `IMLIGHT__Patch_Server__PatchServerInternalUrl` at its IPv4. Its first start mirrors about 19 GB, and a stopped machine doesn't mirror, so keep it running until `/latest` answers: `fly machine update <machine-id> --autostop=off`, then `--autostop=stop`.

1. Install [flyctl](https://fly.io/docs/flyctl/install/), run `fly auth login`, and change `app` in `fly/imlight/fly.toml` if the name is taken. Set `primary_region` near your players.
2. Build the image locally. The Fly image wraps it, and `--local-only` keeps the generator inputs off Fly's builders.

   ```sh
   docker compose build imlight
   ```

3. Create the app and give it a dedicated IPv4 ($2/month; raw TCP needs one).

   ```sh
   fly apps create revive101-imlight --org magus
   fly ips allocate-v4 -a revive101-imlight
   fly ips list -a revive101-imlight
   ```

4. Set the secrets and deploy.

   ```sh
   fly secrets set -a revive101-imlight --stage \
     IMLIGHT__Database__AdminAccountPassword='<password>' \
     IMLIGHT__Game_Server__GameServerIP=<imlight-ip>
   fly deploy fly/imlight --local-only --ha=false
   fly logs -a revive101-imlight
   ```

5. Players start the client with `-L <imlight-ip> 12000`. The first connection after the server has stopped waits while it boots. On Windows, `Start-Client-Production.cmd` wakes the server, waits until Imlight answers, then starts the client.

To open the [server console](#server-console) on Fly from Windows, double-click `Imlight-Console.cmd`. It starts the machine if it has stopped, waits for Imlight, and keeps the machine running while the console is open. Pass a command to run just that one:

```sh
Imlight-Console.cmd account create <user> <password>
```

Elsewhere, run the console over SSH as the app's user, with the machine started:

```sh
fly ssh console -a revive101-imlight -C "sh -c 'cd /app && exec setpriv --reuid=1654 --regid=1654 --clear-groups dotnet Imlight.Director.dll console'"
```

To change other settings, edit `[env]` in `fly/imlight/fly.toml` and deploy again. After `docker compose build`, deploy again to ship the new image.

## Data pack

Imlight reads its game data from a git repository, `SPIRALDB_URL`. To change it:

1. Fork the spiraldb repository and set `SPIRALDB_URL` in `.env` to your fork.
2. Edit your checkout of the fork with Imview, then commit and push.
3. Restart Imlight, which fetches the pack on boot.

   ```sh
   docker compose restart imlight
   ```
