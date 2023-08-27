ShadowVPN
=========

![](https://badge.imagelayers.io/vimagick/shadowvpn:latest.svg)

[`ShadowVPN`][1] is a fast, safe VPN based on libsodium.

## directory tree

```
~/fig/shadowvpn/
├── docker-compose.yml
└── server.conf
```

> Please change password in [server.conf][2] to protect your server.

## docker-compose.yml

```
services:
  shadowvpn:
  image: vimagick/shadowvpn:latest
  ports:
    - "1123:1123/udp"
  volumes:
    - "/root/shadowvpn/server.conf:/etc/shadowvpn/server.conf"
  privileged: true
  restart: always

```

## server

```
$ docker-compose up -d
```

## client

```
$ shadowvpn -c /etc/shadowvpn/client.conf -v
```

> Change settings in [client.conf][3].

[1]: https://shadowvpn.org/
[2]: https://github.com/vimagick/ShadowVPN/blob/master/samples/server.conf
[3]: https://github.com/vimagick/ShadowVPN/blob/master/samples/client.conf
