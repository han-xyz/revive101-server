# revive101-server

Host a Wizard101 private server for friends with Docker Compose. It runs two services:

- Aurorium mirrors the game files from KingsIsle and serves them to clients on port 12369.
- Imlight is the game server (login 12000, realm 12333, patch 12500).

This is not affiliated with or endorsed by KingsIsle. The game files stay on your machine.

## Prerequisites

- Docker with Compose v2.
- A Wizard101 client install and a WizType dump, to produce the generator inputs. [Imlight's generator-input guide](https://github.com/han-xyz/Imlight/blob/feat/imlight-friends-server/deploy/generator-input/README.md) says how.
- About 20 GB of free disk for the mirrored game files.

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

   Before the first clone works: the fork branches must be on GitHub, or the clone fails. Push in this order.

   ```sh
   git -C Imlight/submodule/Imcodec push -u origin e1eee57:refs/heads/crown-shop-types
   git -C Imlight push -u origin feat/imlight-friends-server
   git -C Aurorium push -u origin feat/a5-dockerfile
   git push -u origin feat/h2-submodules
   ```

2. Copy the generator inputs (the WizType JSON and the 29 `*Messages*.xml` files) into `Imlight/deploy/generator-input/` inside the submodule. The Imlight build fails without them.

   ```sh
   cp /path/to/your/generator-input/* Imlight/deploy/generator-input/
   ```

3. Create `.env` and fill in `ADMIN_PASSWORD` and `GAME_SERVER_IP`. Every variable is explained in `.env.example`. The password must not be empty or `compsci`, or Imlight exits at boot.

   ```sh
   cp .env.example .env
   ```

4. Build both images (a few minutes).

   ```sh
   docker compose build
   ```

5. Start Aurorium. On first start it mirrors about 19 GB from KingsIsle, which takes hours. Aurorium answers `/latest` with a revision only when the mirror is ready. Do not start Imlight before then; if you did, run `docker compose restart imlight` once `/latest` prints a revision.

   ```sh
   docker compose up -d aurorium
   curl http://127.0.0.1:12369/latest
   ```

6. `/latest` prints the revision with a `V_` prefix, and Imlight adds that prefix itself when it builds the patch URL. Print the value without it, and if it differs from `GAME_REVISION` in `.env`, set `GAME_REVISION` to it.

   ```sh
   curl -s http://127.0.0.1:12369/latest | sed 's/^V_//'
   ```

7. Start Imlight and wait for two log lines: `TcpListener for ... bound to port 12000 — listening.` and `Patch server at URL http://<GAME_SERVER_IP>:12369/V_<revision> found and set`. Imlight checks the patch server once at boot. If it logs `Patch server endpoint is not available! Continuing without patch server.`, fix reachability (see Network) and run `docker compose restart imlight`.

   ```sh
   docker compose up -d imlight
   docker compose logs -f imlight
   ```

8. Each player starts the client with your server's address.

   ```sh
   WizardGraphicalClient.exe -L <GAME_SERVER_IP> 12000
   ```

9. Create friend accounts. Log in with the admin account (`ADMIN_USERNAME`, `ADMIN_PASSWORD`), create a wizard, enter the world, and type in chat, per [Imlight's command list](https://github.com/han-xyz/Imlight/blob/feat/imlight-friends-server/docs/docs/modules/imlight/commands.md):

    ```text
    .account create <user> <password>
    ```

## Network

On a LAN the setup works as is: set `GAME_SERVER_IP` to the host's LAN address. Clients download game files directly from `http://<GAME_SERVER_IP>:12369`, so Aurorium's port must be reachable at that address, from the Imlight container too. `AURORIUM_BIND` may be narrowed to the `GAME_SERVER_IP` address (for example the VPN IP); any other value breaks patching.

If Imlight logs that the patch server is not available, a host firewall that denies incoming traffic by default (ufw, firewalld) is the usual cause: allow the compose bridge to reach port 12369 on the host, for example `ufw allow in on br-+ to any port 12369 proto tcp`.

For friends over the internet, put everyone on a VPN (Tailscale or WireGuard) and set `GAME_SERVER_IP` to the host's VPN address. Do not port-forward the server to the internet: once a player is attached the server trusts them with its session, and more security fixes are pending.

## Data pack

Imlight reads its game data from a git repository, `SPIRALDB_URL`. To change it:

1. Fork the spiraldb repository and set `SPIRALDB_URL` in `.env` to your fork.
2. Edit your checkout of the fork with Imview, then commit and push.
3. Restart Imlight, which fetches the pack on boot.

   ```sh
   docker compose restart imlight
   ```
