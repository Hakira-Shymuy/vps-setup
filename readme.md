# VPS Setup

This repository contains a **Docker based setup** using **Traefik as a reverse proxy** tools for a **VPS**.

### It Includes
- [Docker](https://www.docker.com/)
- [Traefik](https://traefik.me/)
- [Docker Compose](https://docs.docker.com/compose/)
- [VIM](https://www.vim.org/)

### How to use

You can copy this command bellow and run it in your terminal

```bash
bash <(curl -sSL https://raw.githubusercontent.com/Hakira-Shymuy/vps-setup/main/srv/scripts/setup.sh)
```
It will:
- update the system
- install Git if not installed
- clone this repository into a /tmp/vps-setup directory
- create a /srv directory if not present
- move only the CONTENTS of the "srv" folder into /srv/
- install Docker, Docker Compose.
- install VIM and create a minimal VIM configuration.

## Traefik

#### `traefik/.env.sample`
- Placeholder for the `CF_DNS_API_TOKEN` variable

#### `traefik/compose.yaml`
- Pull traefik image
- Mount the traefik config file
- Mount the certificates folder

#### `traefik/config/traefik.yaml`
- Traefik setup
- Log levels
- Entry points
- Certificate Resolvers
- Providers