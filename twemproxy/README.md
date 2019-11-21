twemproxy
=========

[twemproxy][1] (pronounced "two-em-proxy"), aka nutcracker is a fast and
lightweight proxy for memcached and redis protocol. It was built primarily to
reduce the number of connections to the caching servers on the backend. This,
together with protocol pipelining and sharding enables you to horizontally
scale your distributed caching architecture.

## up and running

```bash
$ docker-compose up -d

$ curl http://127.0.0.1:22222

$ docker-compose exec redis redis-cli -h twemproxy
twemproxy:6379> ping
PONG
twemproxy:6379> set hello world
OK
twemproxy:6379> get hello
"world"
twemproxy:6379> del hello
(integer) 1

$ tail -f data/twemproxy/logs/nutcracker.log
```

[1]: https://github.com/twitter/twemproxy
