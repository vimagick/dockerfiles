dnscrypt + pdnsd
================

## About

- dnscrypt: A protocol for securing communications between a client and a DNS resolver.
- pdnsd: A DNS server designed for local caching of DNS information.

## Fig

    dnscrypt:
      image: vimagick/dnscrypt
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

