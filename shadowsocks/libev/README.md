shadowsocks-libev
=================

[![](https://badge.imagelayers.io/vimagick/shadowsocks-libev:latest.svg)](https://imagelayers.io/?images=vimagick/shadowsocks-libev:latest 'Get your own badge on imagelayers.io')

`shadowsocks-libev` is a lightweight secured socks5 proxy for embedded devices and low end boxes.

It is a port of shadowsocks created by @clowwindy maintained by @madeye and @linusyang.

Compared to `vimagick/shadowsocks`, `vimagick/shadowsocks-libev` uses less cpu/memory/disk.

## CPU/MEMORY

```
$ docker stats shadowsocks_shadowsocks_1

# vimagick/shadowsocks
CONTAINER                   CPU %               MEM USAGE/LIMIT     MEM %               NET I/O
shadowsocks_shadowsocks_1   0.05%               16.56 MiB/741 MiB   2.23%               117.9 KiB/648 B

# vimagick/shadowsocks-libev
CONTAINER                   CPU %               MEM USAGE/LIMIT     MEM %               NET I/O
shadowsocks_shadowsocks_1   0.00%               476 KiB/741 MiB     0.06%               2.334 MiB/2.341 MiB
```

## DISK

```
$ docker images

REPOSITORY                   TAG                 IMAGE ID            CREATED             VIRTUAL SIZE
vimagick/shadowsocks-libev   latest              a36f480e696a        8 minutes ago       15.1 MB
vimagick/shadowsocks         latest              35650c84852a        57 minutes ago      51.25 MB
```
