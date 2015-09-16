shadowsocks
===========

![](https://badge.imagelayers.io/vimagick/shadowsocks:latest.svg)
![](https://badge.imagelayers.io/vimagick/shadowsocks-libev:latest.svg)
![](https://badge.imagelayers.io/vimagick/shadowsocks-arm:latest.svg)

[shadowsocks][1] is a secure socks5 proxy,
designed to protect your Internet traffic.

> If you want to keep a secret,
> you must also hide it from yourself.

## docker-compose.yml

```
server:
  image: vimagick/shadowsocks-libev
  ports:
    - "8388:8388"
  environment:
    - METHOD=chacha20
    - PASSWORD=secret
  restart: always

client:
  image: vimagick/shadowsocks-arm
  ports:
    - "1080:1080"
  environment:
    - SERVER_ADDR=foobar.site
    - METHOD=chacha20
    - PASSWORD=secret
  restart: always
```

## server

I'm running shadowsocks server on Debian (jessie).

```
$ docker-compose up -d server
```

## client

I'm running shadowsocks client on Raspberry Pi 2.

```
$ docker-compose up -d client
```

[read more][2]

[1]: http://shadowsocks.org
[2]: https://github.com/shadowsocks/shadowsocks/wiki/Configuration-via-Config-File
