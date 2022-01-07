redis
=====

![](https://redis.io/images/redis-white.png)

[Redis][1] is an open source key-value store that functions as a data structure server.

## docker-compose.yml

```yaml
version: "3.8"
services:
  redis:
    image: redis:6-alpine
    command: --save 900 1
    ports:
      - "6379:6379"
    volumes:
      - ./data:/data
    restart: unless-stopped
```

[1]: https://redis.io/
