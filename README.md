# revive101-server

Host a Wizard101 private server for friends with Docker Compose. It runs two services:

- Aurorium mirrors the game files from KingsIsle and serves them to clients on port 12369.
- Imlight is the game server (login 12000, realm 12333, patch 12500).

This is not affiliated with or endorsed by KingsIsle. The game files stay on your machine.

## Prerequisites

- Docker with Compose v2.
- A Wizard101 client install and a WizType dump, to produce the generator inputs. [Imlight's generator-input guide](https://github.com/han-xyz/Imlight/blob/feat/l6-dockerfile-quickstart/deploy/generator-input/README.md) says how.
- About 20 GB of free disk for the mirrored game files.

## First run

1. Clone this repo.

   ```sh
   git clone <this repo's URL> revive101-server
   cd revive101-server
   ```

2. Clone the two forks beside the compose file, at the named branches.

   ```sh
   git clone -b feat/a5-dockerfile https://github.com/han-xyz/Aurorium Aurorium
   git clone -b feat/l6-dockerfile-quickstart https://github.com/han-xyz/Imlight Imlight
   ```

3. Copy the generator inputs (the WizType JSON and the 29 `*Messages*.xml` files) into Imlight's build context. The Imlight build fails without them.

   ```sh
   cp /path/to/your/generator-input/* Imlight/deploy/generator-input/
   ```

4. Create `.env` and fill in `ADMIN_PASSWORD` and `GAME_SERVER_IP`. Every variable is explained in `.env.example`.

   ```sh
   cp .env.example .env
   ```

5. Build both images (a few minutes).

   ```sh
   docker compose build
   ```

6. Start Aurorium. On first start it mirrors about 19 GB from KingsIsle, which takes hours. Aurorium answers `/latest` with a revision only when the mirror is ready.

   ```sh
   docker compose up -d aurorium
   curl http://127.0.0.1:12369/latest
   ```

7. If the revision printed differs from `GAME_REVISION` in `.env`, set `GAME_REVISION` to it.

8. Start Imlight and wait for the log line `TcpListener for ... bound to port 12000 — listening.`

   ```sh
   docker compose up -d imlight
   docker compose logs -f imlight
   ```

9. Each player starts the client with your server's address.

   ```sh
   WizardGraphicalClient.exe -L <GAME_SERVER_IP> 12000
   ```

10. Create friend accounts. Log in with the admin account (`ADMIN_USERNAME`, `ADMIN_PASSWORD`) and type in game chat, per [Imlight's command list](https://github.com/han-xyz/Imlight/blob/feat/l6-dockerfile-quickstart/docs/docs/modules/imlight/commands.md):

    ```text
    .account create <user> <password>
    ```

## Network

On a LAN the setup works as is: set `GAME_SERVER_IP` to the host's LAN address. Clients download game files directly from `http://<GAME_SERVER_IP>:12369`, so Aurorium's port must be reachable at that address.

For friends over the internet, put everyone on a VPN (Tailscale or WireGuard) and set `GAME_SERVER_IP` to the host's VPN address. Do not port-forward the server to the internet: once a player is attached the server trusts them with its session, and Imlight's security audit has more fixes pending.

## Data pack

Imlight reads its game data from a git repository, `SPIRALDB_URL`. To change it:

1. Fork the spiraldb repository and set `SPIRALDB_URL` in `.env` to your fork.
2. Edit your checkout of the fork with Imview, then commit and push.
3. Restart Imlight, which fetches the pack on boot.

   ```sh
   docker compose restart imlight
   ```
