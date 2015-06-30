pdnsd
=====

[![](https://badge.imagelayers.io/vimagick/pdnsd:latest.svg)](https://imagelayers.io/?images=vimagick/pdnsd:latest)

`pdnsd` is a proxy DNS server with permanent caching (the cache contents are
written to hard disk on exit) that is designed to cope with unreachable or down
DNS servers (for example in dial-in networking).

Since version 1.1.0, pdnsd supports negative caching.

## docker-compose.yml

```
pdnsd:
  image: vimagick/pdnsd
# volumes:
#   - pdnsd.conf:/etc/pdnsd.conf
  ports:
    - "53:53/tcp"
    - "53:53/udp"
  restart: always
```

> Uncomment `volumes` to use customized config file.

## server

```
$ cd ~/fig/pdnsd/
$ docker-compose up -d
$ docker exec pdnsd_pdnsd_1 pdnsd-ctl status
```

## client

```
$ dig @1.2.3.4 www.youtube.com
```
