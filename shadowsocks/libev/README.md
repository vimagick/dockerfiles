shadowsocks-libev
=================

`shadowsocks-libev` is a lightweight secured socks5 proxy for embedded devices and low end boxes.

It is a port of shadowsocks created by @clowwindy maintained by @madeye and @linusyang.

Compared to `vimagick/shadowsocks`, `vimagick/shadowsocks-libev` uses less memory.

```
$ docker stats shadowsocks_shadowsocks_1

# vimagick/shadowsocks
CONTAINER                   CPU %               MEM USAGE/LIMIT     MEM %               NET I/O
shadowsocks_shadowsocks_1   0.05%               16.56 MiB/741 MiB   2.23%               117.9 KiB/648 B

# vimagick/shadowsocks-libev
CONTAINER                   CPU %               MEM USAGE/LIMIT     MEM %               NET I/O
shadowsocks_shadowsocks_1   0.00%               2.406 MiB/741 MiB   0.32%               6.475 MiB/6.425 MiB
```
