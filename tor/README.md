tor
===

[`Tor`][1] is free software and an open network that helps you defend against
traffic analysis, a form of network surveillance that threatens personal
freedom and privacy, confidential business activities and relationships, and
state security.

- Tor prevents people from learning your location or browsing habits.
- Tor is for web browsers, instant messaging clients, and more.
- Tor is free and open source for Windows, Mac, Linux/Unix, and Android

## docker-compose.yml

```
tor:
  image: vimagick/tor
  ports:
    - "9001:9001"
    - "9030:9030"
    - "9050:9050"
    - "9051:9051"
  volumes:
    - ./torrc:/etc/tor/torrc
  restart: always
```

## torrc

```
RunAsDaemon 0
SocksPort 0.0.0.0:9050
ORPort 9001
BridgeRelay 1
#ServerTransportPlugin obfs4 exec /usr/bin/obfs4proxy
ExtORPort auto
Exitpolicy reject *:*
ContactInfo noreply@datageek.info
Nickname datageek
```

> Try to install `obfs4proxy` into container.

## up and running

```
$ docker-compose up -d
$ curl -x socks5h://127.0.0.1:9050 ifconfig.me
```

