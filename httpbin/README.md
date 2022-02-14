httpbin
=======

![](https://badge.imagelayers.io/vimagick/httpbin:latest.svg)

[httpbin][1] is a HTTP Request & Response Service, written in Python + Flask.

## docker-compose.yml

```yaml
version: "3.8"
services:
  httpbin:
    image: vimagick/httpbin
    ports:
      - "8000:8000"
    restart: unless-stopped
```

## up and running

```bash
$ docker-compose up -d
$ curl http://127.0.0.1:27815/ip
```

[1]: http://httpbin.org
