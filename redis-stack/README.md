redis-stack
===========

![](https://redis.io/images/redis-white.png)

[Redis Stack][1] is an extension of Redis that adds modern data models and
processing engines to provide a complete developer experience.

## docker-compose.yml

```yaml
version: "3.8"
services:
  redis-stack:
    image: redis/redis-stack-server
    ports:
      - "6379:6379"
      - "8001:8001"
    volumes:
      - ./data:/data
    environment:
      REDIS_ARGS: "--save 900 1"
      REDISTIMESERIES_ARGS: "RETENTION_POLICY=20"
    restart: unless-stopped
```

[1]: https://redis.io/docs/stack/
