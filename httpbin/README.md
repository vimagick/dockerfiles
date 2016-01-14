httpbin
=======

![](https://badge.imagelayers.io/vimagick/httpbin:latest.svg)

[httpbin][1] is a HTTP Request & Response Service, written in Python + Flask.

## docker-compose.yml

```yaml
httpbin:
  image: vimagick/httpbin
  ports:
    - "27815:80"
  restart: always
```

## up and running

```
$ docker-compose up -d
$ curl http://127.0.0.1:27815/ip
```

[1]: http://httpbin.org
