chinadns + dnsmasq
==================

## About

- chinadns: Protect yourself against DNS poisoning in China.
- dnsmasq: A free software DNS forwarder and DHCP server for small networks.

## Fig

    chinadns:
      image: vimagick/chinadns
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

