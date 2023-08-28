privoxy
=======

![](https://badge.imagelayers.io/vimagick/privoxy:latest.svg)

[Privoxy][1] is a non-caching web proxy with advanced filtering capabilities for
enhancing privacy, modifying web page data and HTTP headers, controlling
access, and removing ads and other obnoxious Internet junk. Privoxy has a
flexible configuration and can be customized to suit individual needs and
tastes. It has application for both stand-alone systems and multi-user
networks.

## directory tree

```
~/fig/privoxy/
├── docker-compose.yml
└── privoxy/
    ├── config
    ├── user.action
    └── user.filter
```

file: docker-compose.yml

```yaml
version: "3.8"
services:
  privoxy:
    image: vimagick/privoxy
    ports:
      - "8118:8118"
    volumes:
      - ./data/config:/etc/privoxy/config
      - ./data/user.action:/etc/privoxy/user.action
      - ./data/user.filter:/etc/privoxy/user.filter
    restart: unless-stopped
```

file: user.action

```
{+filter{rot}}
/

{+block}
127.0.0.1
45.32.57.113
.easypi.duckdns.org
```

> :warning: Make sure you block ip/domain which point to server itself.

file: user.filter

```
FILTER: rot rotate image
s|</head>|<style>img{transform: rotate(180deg);}</style></head>|gisU
```

## server

```bash
$ cd ~/fig/privoxy/
$ docker-compose up -d
$ docker-compose logs
Attaching to privoxy_privoxy_1
privoxy_1 | 2023-08-28 17:47:32.838 7ff17bdb5048 Info: Privoxy version 3.0.34
privoxy_1 | 2023-08-28 17:47:32.838 7ff17bdb5048 Info: Program name: privoxy
privoxy_1 | 2023-08-28 17:47:32.839 7ff17bdb5048 Info: Loading filter file: /etc/privoxy/default.filter
privoxy_1 | 2023-08-28 17:47:32.845 7ff17bdb5048 Info: Loading filter file: /etc/privoxy/user.filter
privoxy_1 | 2023-08-28 17:47:32.845 7ff17bdb5048 Info: Loading actions file: /etc/privoxy/match-all.action
privoxy_1 | 2023-08-28 17:47:32.845 7ff17bdb5048 Info: Loading actions file: /etc/privoxy/default.action
privoxy_1 | 2023-08-28 17:47:32.852 7ff17bdb5048 Info: Loading actions file: /etc/privoxy/user.action
privoxy_1 | 2023-08-28 17:47:32.852 7ff17bdb5048 Info: Listening on port 8118 on IP address 0.0.0.0
privoxy_1 | 2023-08-28 17:48:27.607 7ff17bff3ab0 Request: www.example.org/
privoxy_1 | 2023-08-28 17:48:53.069 7ff17bff3ab0 Request: www.example.org/
```

## client

```bash
$ docker network ls
$ docker run --rm --network privoxy_default alpine wget -O- http://www.example.org

$ export http_proxy=127.0.0.1:8118
$ wget -O- http://www.example.org
```

In both cases, you will see `<style>img{transform: rotate(180deg);}</style></head>` in output.

[1]: https://www.privoxy.org/
