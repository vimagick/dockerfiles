redis
=====

![](https://redis.io/images/redis-white.png)

[Redis][1] is an open source key-value store that functions as a data structure server.

## docker-compose.yml

```yaml
redis:
  image: redis:alpine
  ports:
    - "127.0.0.1:6379:6379"
  volumes:
    - ./data:/data
  restart: always
```

[1]: https://redis.io/
