nodebb
======

![](https://badge.imagelayers.io/vimagick/nodebb:latest.svg)

[NodeBB][1] Forum Software is powered by Node.js and built on either a Redis or MongoDB database.

Read the [docs][2].

## docker-compose.yml

```yaml
nodebb:
  image: vimagick/nodebb
  ports:
    - "4567:4567"
  links:
    - redis
  volumes:
    - ./data:/var/lib/nodebb
    - /usr/src/nodebb/build
  restart: always

redis:
  image: redis:alpine
  ports:
    - "127.0.0.1:6379:6379"
  volumes:
    - ./data:/data
  restart: always
```

## up and running

```bash
$ docker-compose up -d
$ vim data/config.json
$ docker-compose restart nodebb
$ firefox http://localhost:4567
```

> Host IP or address of your Redis instance: `redis`

## software upgrade

```bash
$ docker-compose pull nodebb
$ docker-compose exec nodebb sh
>>> ./nodebb build
>>> exit
```

[1]: https://nodebb.org/
[2]: https://docs.nodebb.org/en/latest/
