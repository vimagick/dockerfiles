[`ShadowVPN`][1] is a fast, safe VPN based on libsodium.

## directory tree

```
~/fig/shadowvpn/
.
├── docker-compose.yml
└── shadowvpn/
    ├── server.conf
    ├── server_down.sh
    └── server_up.sh
```

## docker-compose.yml

```
shadowvpn:
  image: vimagick/shadowvpn
  ports:
    - "1123:1123/udp"
  volumes:
    - "shadowvpn:/etc/shadowvpn"
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

[1]: https://shadowvpn.org/
