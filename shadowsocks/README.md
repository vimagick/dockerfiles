shadowsocks
===========

> :warning: This project has been moved to <https://github.com/EasyPi/docker-shadowsocks-libev>.

name                       | size
-------------------------- | ---------------------------------------------------------------------------
[shadowsocks][1]           | ![](https://badge.imagelayers.io/vimagick/shadowsocks:latest.svg)
[shadowsocks-libev][2]     | ![](https://badge.imagelayers.io/vimagick/shadowsocks-libev:latest.svg)
[shadowsocks-arm][3]       | ![](https://badge.imagelayers.io/vimagick/shadowsocks-arm:latest.svg)
[shadowsocks-libev-arm][4] | ![](https://badge.imagelayers.io/vimagick/shadowsocks-libev-arm:latest.svg)

[shadowsocks][5] is a secure socks5 proxy, designed to protect your Internet traffic.

> If you want to keep a secret, you must also hide it from yourself.

## docker-compose.yml

For Linux Server

```yaml
server:
  image: vimagick/shadowsocks-libev
  ports:
    - "8388:8388"
  environment:
    - METHOD=chacha20
    - PASSWORD=secret
  restart: always

client:
  image: vimagick/shadowsocks-libev
  command: ss-local -s foobar.site -p 8388 -b 0.0.0.0 -l 1080 -k secret -m chacha20
  ports:
    - "1080:1080"
  restart: always
```

For Raspberry Pi

```yaml
client:
  image: vimagick/shadowsocks-libev-arm
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

[1]: https://hub.docker.com/r/vimagick/shadowsocks/
[2]: https://hub.docker.com/r/vimagick/shadowsocks-libev/
[3]: https://hub.docker.com/r/vimagick/shadowsocks-arm/
[4]: https://hub.docker.com/r/vimagick/shadowsocks-libev-arm/
[5]: http://shadowsocks.org
[6]: https://github.com/shadowsocks/shadowsocks/wiki/Configuration-via-Config-File
