ghost
=====

## docker-compose.yml

```
ghost:
    image: ghost
    ports:
        - "127.0.0.1:2368:2368"
    restart: always
```

## Up and Running

```
$ docker-compose up -d
$ docker exec -it ghost_ghost_1 bash
>>> cd /var/lib/ghost/
>>> sed -i 's/localhost:2368/blog.easypi.info/' config.js
>>> sed -i '/google/d' themes/casper/default.hbs
>>> exit
$ docker-compose restart
```
