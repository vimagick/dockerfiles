red5
====

![](https://badge.imagelayers.io/vimagick/red5-server:latest.svg)

[Red5][1] is an Open Source Flash Server written in Java.

## docker-compose.yml

```yaml
red5:
  image: vimagick/red5
  ports:
    - "1935:1935"  # rtmp/e
    - "5080:5080"  # http
    - "8081:8081"  # websocket
  restart: always
```

## references

- <https://github.com/Red5/docker>

[1]: https://github.com/Red5/red5-server
