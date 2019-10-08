flower
======

[Flower][1] is a web based tool for monitoring and administrating Celery clusters.

## docker-compose.yml

```yaml
flower:
  image: mher/flower
  ports:
    - "5555:5555"
  environment:
    - CELERY_BROKER_URL=redis://redis:6379/0
    - FLOWER_PORT=5555
    - FLOWER_BASIC_AUTH=username:password
  extra_hosts:
    - redis:x.x.x.x
  restart: always
```

[1]: https://flower.readthedocs.io/en/latest/
