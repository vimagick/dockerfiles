[`tinc`][1] is a Virtual Private Network (VPN) daemon that uses tunnelling and
encryption to create a secure private network between hosts on the Internet.

To use this image, you need to:

- Have baisc knowledges of tinc
- Create a directory tree by hand [read this][2]
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
server:
  image: vimagick/tinc
  ports:
    - "655:655/udp"
  volumes:
    - tinc:/etc/tinc
  net: host
  privileged: true
  restart: always
```

[1]: http://tinc-vpn.org/
[2]: https://www.digitalocean.com/community/tutorials/how-to-install-tinc-and-set-up-a-basic-vpn-on-ubuntu-14-04
