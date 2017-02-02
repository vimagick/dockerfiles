shadowsocks-libev
=================

> ⚠️ This docker image becomes obsolete, and has moved to <https://github.com/EasyPi/docker-shadowsocks-libev>.

![](https://badge.imagelayers.io/vimagick/shadowsocks-libev:latest.svg)

![](http://dockeri.co/image/vimagick/shadowsocks-libev)

[shadowsocks-libev][1] is a lightweight secured socks5 proxy for embedded devices and low end boxes.

It is a port of shadowsocks created by [@clowwindy][2] maintained by [@madeye][3] and [@linusyang][4].

Compared to [vimagick/shadowsocks][5], [vimagick/shadowsocks-libev][6] uses less CPU/Memory/Disk.

## docker-compose.yml

```yaml
shadowsocks:
  image: vimagick/shadowsocks-libev
  ports:
    - "8388:8388"
  environment:
    - PASSWORD=9MLSpPmNt
  restart: always
```

> Please choose a strong password to protect your server.

## CPU/Memory Usage

```bash
$ docker stats shadowsocks_shadowsocks_1

# vimagick/shadowsocks
CONTAINER                   CPU %               MEM USAGE/LIMIT     MEM %               NET I/O
shadowsocks_shadowsocks_1   0.05%               16.56 MiB/741 MiB   2.23%               117.9 KiB/648 B

# vimagick/shadowsocks-libev
CONTAINER                   CPU %               MEM USAGE/LIMIT     MEM %               NET I/O
shadowsocks_shadowsocks_1   0.00%               476 KiB/741 MiB     0.06%               2.334 MiB/2.341 MiB
```

## Disk Usage

```bash
$ docker images

REPOSITORY                   TAG                 IMAGE ID            CREATED             VIRTUAL SIZE
vimagick/shadowsocks-libev   latest              a36f480e696a        8 minutes ago       15.1 MB
vimagick/shadowsocks         latest              35650c84852a        57 minutes ago      51.25 MB
```

## Raspberry Pi

To setup a shadowsocks client on Raspberry Pi, please use [easypi/shadowsocks-libev-arm][7].

[1]: https://github.com/shadowsocks/shadowsocks-libev
[2]: https://github.com/clowwindy
[3]: https://github.com/madeye
[4]: https://github.com/linusyang
[5]: https://hub.docker.com/r/vimagick/shadowsocks/
[6]: https://hub.docker.com/r/vimagick/shadowsocks-libev/
[7]: https://hub.docker.com/r/easypi/shadowsocks-libev-arm/
