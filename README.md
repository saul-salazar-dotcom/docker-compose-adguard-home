# Adguard Home in Docker Compose

![](homeguard.svg)

AdGuard Home in Docker Compose with configs

## Requirements
- [Docker Engine](https://docs.docker.com/engine/install/)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Optional
- This project is exposed behind the [docker-nginx-proxy-basic](https://gitlab.com/saulmendoza/docker-nginx-proxy-basic.git), which uses `jwilder/nginx-proxy`, now known just as [nginx-proxy](https://github.com/nginx-proxy/nginx-proxy).
- But this is optional, if you dont want the proxy just [remove 7 lines of code](#if-not-running behind-a-proxy)

## Quick Start
```sh
git clone https://gitlab.com/saulmendoza/docker-adguard-home.git
cd docker-adguard-home
docker-compose up -d

# After updating config.yml you should run:
./rebuild.sh
```

## Default user/password
- User: homeadguard
- Pass: password

## How to update/encrypt a password inside config.yml
```sh
docker run --rm httpd:2.4-alpine htpasswd -nbBC 10 user "your-new-password" | cut -d ":" -f 2
```

## If not running behind a proxy
You will need to remove two things, the `networks` and `environment` properties from the `docker-compose.yml` file

```yml
networks:
  default:
    external:
      name: nginx-proxy
```

```yml
    environment:
      - VIRTUAL_HOST=dns.woki.com
      - VIRTUAL_PORT=80
```
