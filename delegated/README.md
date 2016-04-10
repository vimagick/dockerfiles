delegated
=========

![](https://badge.imagelayers.io/vimagick/delegated:latest.svg)

[DeleGate][1] is a multipurpose proxy server which relays various application
protocols on TCP/IP or UDP/IP

## docker-compose.yml

```
delegated:
  image: vimagick/delegated
  command: "-P1080 SERVER=socks"
  ports:
    - "1080:1080"
  restart: always
```

## up and running

```
# server
$ docker-compose up -d

# client
$ curl -x socks5h://localhost:1080 ifconfig.ovh
```

[1]: http://www.delegate.org/delegate/
