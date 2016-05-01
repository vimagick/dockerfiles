dnscrypt
========

## About

- `dnscrypt-wrapper` - A server-side dnscrypt proxy.
- `dnscrypt-proxy` - A protocol for securing communications between a client and a DNS resolver.

## Config

    wrapper:
      image: vimagick/dnscrypt-wrapper
      ports:
        - "443:443/udp"
        - "443:443/tcp"
      environment:
        - LISTEN_ADDR=0.0.0.0:443
        - RESOLVER_ADDR=8.8.8.8:53
        - PROVIDER_NAME=2.dnscrypt-cert.easypi.info
      restart: always

    proxy:
      image: vimagick/dnscrypt-proxy
      ports:
        - "53:53/udp"
        - "53:53/tcp"
      environment:
        - LISTEN_ADDR=0.0.0.0:443
        - RESOLVER_ADDR=1.2.3.4:443
        - PROVIDER_NAME=2.dnscrypt-cert.easypi.info
        - PROVIDER_KEY=4C29:9CEB:CF8D:4612:48A8:B2F2:3B6F:A046:EBF5:2F2B:6433:27C6:5F3A:88F5:495E:3075
      restart: always

> `RESOLVER_ADDR` is server public ip address.

## Server

    $ cd dnscrypt
    $ fig up -d wrapper
    $ docker exec -it dnscrypt_wrapper_1 cat README.txt
    Public key fingerprint: 4C29:9CEB:CF8D:4612:48A8:B2F2:3B6F:A046:EBF5:2F2B:6433:27C6:5F3A:88F5:495E:3075

## Client

    $ cd dnscrypt
    $ fig up -d proxy
    $ dig @127.0.0.1 www.google.com
    $ dig @127.0.0.1 www.youtube.com +tcp

## Note

You'd better to use `vimagick/dnscrypt-proxy` as backend of `dnsmasq` or `pdnsd` for better performance.

Please read [this](https://github.com/Cofyc/dnscrypt-wrapper) to re-generate keys!
