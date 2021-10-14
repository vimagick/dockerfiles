squid
=====

![](https://badge.imagelayers.io/vimagick/squid:latest.svg)

[Squid][1] is a caching proxy for the Web supporting HTTP, HTTPS, FTP, and
more. It reduces bandwidth and improves response times by caching and reusing
frequently-requested web pages. Squid has extensive access controls and makes a
great server accelerator. It runs on most available operating systems,
including Windows and is licensed under the GNU GPL.

## docker-compose.yml

```yaml
version: "3.8"
services:
  squid:
    image: vimagick/squid
    ports:
      - "3128:3128/tcp"
      - "3130:3130/udp"
    volumes:
      - ./data/cache:/var/cache/squid
      - ./data/log:/var/log/squid
    stop_signal: SIGKILL
    restart: unless-stopped
```

> You can mount custom config file as `/etc/squid/squid.conf`.

## Up and Running

```bash
# server
$ mkdir -p data/{cache,log}
$ chmod -R 777 data
$ docker-compose up -d

# client
$ curl -x 127.0.0.1:3128 ifconfig.co
```

[1]: http://www.squid-cache.org/
