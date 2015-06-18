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
Log notice stdout
RunAsDaemon 0
SocksPort 0.0.0.0:9050
ORPort 9001
DirPort 9030
BridgeRelay 1
ServerTransportPlugin obfs3 exec /usr/bin/obfsproxy
ExtORPort auto
Exitpolicy reject *:*
ContactInfo noreply@datageek.info
Nickname datageek
```

## up and running

```
$ docker-compose up -d
$ curl -x socks5h://127.0.0.1:9050 ifconfig.me
```

## todo

- support `obfs4proxy`

