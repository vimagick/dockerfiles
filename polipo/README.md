Polipo — a caching web proxy
============================

`Polipo` is a small and fast caching web proxy (a web cache, an HTTP proxy, a
proxy server). While Polipo was designed to be used by one person or a small
group of people, there is nothing that prevents it from being used by a larger
group.

## docker-compose.yml

```
polipo:
  image: vimagick/polipo
  command: authCredentials=username:password
  ports:
    - "8123:8123"
  restart: always
```

## server

```
$ docker-compose up -d
```

## client

```
$ curl -x http://username:password@server:8123 https://www.youtube.com/
```
