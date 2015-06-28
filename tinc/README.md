tinc
====

[![](https://badge.imagelayers.io/vimagick/tinc:latest.svg)](https://imagelayers.io/?images=vimagick/tinc:latest)

[`tinc`][1] is a Virtual Private Network (VPN) daemon that uses tunnelling and
encryption to create a secure private network between hosts on the Internet.

This tiny image (6.74 MB) is based on `alpine` (5.254 MB).
To use this image, you need to:

- Have baisc knowledges of tinc
- Create a directory tree by hand ([tutor][2])
- Use `docker-compose` to manage

## directory tree

```
~/fig/tinc/
├── docker-compose.yml
└── tinc/
    ├── netname/
    │   ├── hosts/
    │   │   ├── client
    │   │   ├── client-down
    │   │   ├── client-up
    │   │   └── server
    │   ├── rsa_key.priv
    │   ├── tinc.conf
    │   ├── tinc-down
    │   └── tinc-up
    └── nets.boot
```

## docker-compose.yml

```
tinc:
  image: vimagick/tinc
  ports:
    - "655:655/tcp"
    - "655:655/udp"
  volumes:
    - tinc:/etc/tinc
  environment:
    - VERBOSE=2
  cap_add:
    - NET_ADMIN
  restart: always
```

## server

```
# run
$ docker-compose up -d

# monitor
$ docker-compose logs

# stats
$ watch docker exec tinc_tinc_1 netstat -an
```

## client

```
# start
$ tincd -d -D -n netname --pidfile /tmp/tinc.pid

# stop
$ tincd -k --pidfile /tmp/tinc.pid
```

[1]: http://tinc-vpn.org/
[2]: https://www.digitalocean.com/community/tutorials/how-to-install-tinc-and-set-up-a-basic-vpn-on-ubuntu-14-04
