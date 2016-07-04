live555
=======

![](https://badge.imagelayers.io/vimagick/live555:latest.svg)

The [LIVE555 Media Server][1] is a complete RTSP server application. It can
stream several kinds of media file (which must be stored in the current working
directory - i.e., the directory from which you launch the application - or a
subdirectory.)

## docker-compose.yml

```yaml
live555:
  image: vimagick/live555
  ports:
    - "8080:80"
    - "554:554"
  volumes:
    - ./data:/data
  restart: always
```

[1]: http://www.live555.com/mediaServer/
