nodebb
======

![](https://badge.imagelayers.io/vimagick/nodebb:latest.svg)

[NodeBB][1] Forum Software is powered by Node.js and built on either a Redis or MongoDB database.

## docker-compose.yml

```
nodebb:
  image: vimagick/nodebb
  ports:
    - "4567:4567"
  links:
    - redis
  restart: always

redis:
  image: redis
  ports:
    - "127.0.0.1:6379:6379"
  restart: always
```

## up and running

```
$ docker-compose up -d
$ firefox http://localhost:4567
```

> Host IP or address of your Redis instance: `redis`

[1]: https://nodebb.org/
