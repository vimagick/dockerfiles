nodebb
======

![](https://badge.imagelayers.io/vimagick/nodebb:latest.svg)

[NodeBB][1] Forum Software is powered by Node.js and built on either a Redis or MongoDB database.

Read the [docs][2].

## docker-compose.yml

```yaml
version: "3.8"

services:

  nodebb:
    image: vimagick/nodebb
    init: true
    ports:
      - "4567:4567"
    volumes:
      - ./data:/var/lib/nodebb
      - /usr/src/nodebb/build
      - /usr/src/nodebb/node_modules
      - /usr/src/nodebb/public/uploads
    depends_on:
      - redis
    restart: unless-stopped

  redis:
    image: redis:6-alpine
    volumes:
      - ./data:/data
    restart: unless-stopped
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
>>> ./nodebb upgrade
>>> exit
```

[1]: https://nodebb.org/
[2]: https://docs.nodebb.org/
