openresty
=========

[OpenResty®][1] is a dynamic web platform based on NGINX and LuaJIT.

```bash
# up and running
$ docker-compose up -d

# edit config
$ vim data/conf.d/default.conf

# check config
$ docker-compose exec openresty openresty -t

# reload config
$ docker-compose exec openresty openresty -s reload
```

[1]: https://openresty.org/
