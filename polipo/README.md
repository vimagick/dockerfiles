Polipo — a caching web proxy
============================

[Polipo][1] is a small and fast caching web proxy (a web cache, an HTTP proxy, a
proxy server). While Polipo was designed to be used by one person or a small
group of people, there is nothing that prevents it from being used by a larger
group.

## docker-compose.yml

```yaml
version: "3.8"
services:
  polipo:
    image: vimagick/polipo
    command:
      authCredentials=username:password
      socksParentProxy=1.2.3.4:9050
      dnsNameServer=8.8.8.8
    ports:
      - "8123:8123"
    restart: unless-stopped
```

## server

```bash
$ docker-compose up -d
```

## client

```bash
$ curl -x http://username:password@server:8123 https://www.youtube.com/
```

[1]: https://www.irif.univ-paris-diderot.fr/~jch/software/polipo/
