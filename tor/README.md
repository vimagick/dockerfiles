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
  volumes:
    - ./torrc:/etc/tor/torrc
  restart: always
```

## torrc (server)

```
SocksPort 0
ORPort 9001
BridgeRelay 1
Exitpolicy reject *:*
Nickname datageek
ContactInfo noreply@datageek.info
ServerTransportPlugin obfs3 exec /usr/bin/obfsproxy managed
```

## torrc (client)

```
#Socks5Proxy 127.0.0.1:1080
UseBridges 1
Bridge obfs3 1.2.3.4:9001 F24BF4DE74649E205A8A3621C84F97FF623B2083
```

> Please connect via `Socks5Proxy` if you're blocked!

## server

```
$ docker-compose up -d
$ docker-compose logs
$ docker exec tor_tor_1 cat /root/.tor/fingerprint
datageek F24BF4DE74649E205A8A3621C84F97FF623B2083
```

## client

```
$ tor -f /etc/tor/torrc
$ curl -x socks5h://127.0.0.1:9050 ifconfig.me
```

## references

- https://www.torproject.org/projects/obfsproxy-debian-instructions.html.en
