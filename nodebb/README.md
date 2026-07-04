nodebb
======

![](https://badge.imagelayers.io/vimagick/nodebb:latest.svg)

[NodeBB][1] Forum Software is powered by Node.js and built on either a Redis or MongoDB database.

Read the [docs][2].

## up and running

```bash
$ mkdir -p data/{nodebb,redis}
$ chown 1001:1001 data/nodebb
$ docker-compose up -d
$ open http://localhost:4567
```

> Host IP or address of your Redis instance: `redis`

[1]: https://nodebb.org/
[2]: https://docs.nodebb.org/
