cadvisor
========

![](https://badge.imagelayers.io/vimagick/cadvisor:latest.svg)

[cAdvisor][1] (Container Advisor) provides container users an understanding of
the resource usage and performance characteristics of their running containers.

## docker-compose.yml

```yaml
cadvisor:
  image: vimagick/cadvisor
  ports:
    - "8080:8080"
  volumes:
    - /:/rootfs:ro
    - /var/run:/var/run:rw
    - /sys:/sys:ro
    - /var/lib/docker/:/var/lib/docker:ro
  restart: always
```

[1]: https://github.com/google/cadvisor
