dnscrypt
========

## About

- `dnscrypt-wrapper` - A server-side dnscrypt proxy.
- `dnscrypt-proxy` - A protocol for securing communications between a client and a DNS resolver.

## Fig

    wrapper:
      image: vimagick/dnscrypt-wrapper
      ports:
        - "443:443/udp"
        - "443:443/tcp"
      restart: always

    proxy:
      image: vimagick/dnscrypt-proxy
      ports:
        - "53:53/udp"
        - "53:53/tcp"
      restart: always

## Run

    fig up -d

## Test

    # UDP
    dig @127.0.0.1 www.google.com

    # TCP
    dig @127.0.0.1 www.youtube.com +tcp

