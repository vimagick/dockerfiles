nodebb
======

![](https://badge.imagelayers.io/vimagick/nodebb:latest.svg)

[NodeBB][1] Forum Software is powered by Node.js and built on either a Redis or MongoDB database.

Read the [docs][2].

## up and running

```bash
$ docker-compose run --rm --service-ports nodebb bash
>>> ./nodebb --config config/config.json setup
>>> exit
$ docker-compose up -d
$ firefox http://localhost:4567
```

> Host IP or address of your Redis instance: `redis`

## software upgrade

```bash
$ docker-compose pull nodebb
$ docker-compose exec nodebb bash
>>> ./nodebb upgrade
>>> exit
```

[1]: https://nodebb.org/
[2]: https://docs.nodebb.org/
