tor
===

![](https://badge.imagelayers.io/vimagick/tor:latest.svg)

[`Tor`][1] is free software and an open network that helps you defend against
traffic analysis, a form of network surveillance that threatens personal
freedom and privacy, confidential business activities and relationships, and
state security.

- Tor prevents people from learning your location or browsing habits.
- Tor is for web browsers, instant messaging clients, and more.
- Tor is free and open source for Windows, Mac, Linux/Unix, and Android

ServerTransportPlugin:

- [x] fte
- [x] meek
- [x] obfs3
- [x] obfs4

## docker-compose.yml

```
tor:
  image: vimagick/tor
  ports:
#   - "7002:7002"
    - "9001:9001"
# volumes:
#   - ./torrc:/etc/tor/torrc
#   - ./cert.pem:/var/lib/tor/cert.pem
#   - ./key.pem:/var/lib/tor/key.pem
  restart: always
```

> Default `torrc` is for `obfs4`.
> Uncomment lines to use `meek`.

## torrc (server)

```
BridgeRelay 1
ContactInfo noreply@easypi.info
DataDirectory /var/lib/tor
Exitpolicy reject *:*
Nickname easypi
ORPort 9001
PublishServerDescriptor 0
SocksPort 0
#ServerTransportPlugin fte exec /usr/bin/fteproxy --mode server --managed
#ServerTransportPlugin meek exec /usr/bin/meek-server --port 7002 --cert cert.pem --key key.pem
#ServerTransportPlugin obfs3 exec /usr/bin/obfsproxy managed
ServerTransportPlugin obfs4 exec /usr/bin/obfs4proxy
```

## torrc (client)

```
#Socks5Proxy 127.0.0.1:1080
UseBridges 1
#Bridge fte 1.2.3.4:9001 F24BF4DE74649E205A8A3621C84F97FF623B2083
#Bridge meek 1.2.3.4:9001 url=https://meek.easypi.info:7002/
#Bridge obfs3 1.2.3.4:9001 F24BF4DE74649E205A8A3621C84F97FF623B2083
Bridge obfs4 1.2.3.4:9001 F24BF4DE74649E205A8A3621C84F97FF623B2083
#ClientTransportPlugin fte exec /usr/local/bin/fteproxy
#ClientTransportPlugin meek exec /usr/local/bin/meek-client
#ClientTransportPlugin obfs3 exec /usr/local/bin/obfsproxy
ClientTransportPlugin obfs4 exec /usr/local/bin/obfs4proxy
```

> Please connect via `HTTPProxy`/`HTTPSProxy`/`Socks5Proxy` if you're blocked!

## server

```
$ openssl req -x509 -newkey rsa:2048 -keyout key.pem -out cert.pem -days 365 -nodes -subj "/C=JP/ST=Tokyo/L=Heiwajima/O=DataGeek/OU=Org/CN=meek.easypi.info"
$ docker-compose up -d
$ docker-compose logs
$ docker-compose exec tor tor --quiet --list-fingerprint
easypi F24B F4DE 7464 9E20 5A8A 3621 C84F 97FF 623B 2083
```

## client

```
$ tor -f /etc/tor/torrc
$ curl -x socks5h://127.0.0.1:9050 ifconfig.ovh
```

## references

- https://www.torproject.org/projects/obfsproxy-debian-instructions.html.en
- https://blog.torproject.org/blog/how-use-%E2%80%9Cmeek%E2%80%9D-pluggable-transport
- https://fteproxy.org/help-server-with-tor
- https://github.com/Yawning/obfs4

[1]: https://www.torproject.org/
