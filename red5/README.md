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

## Server Setup

```bash
$ docker-compose up -d
$ docker-compose exec red5 bash
>>> vi /opt/red5/conf/red5.properties
>>> exit
$ docker-compose restart
```

## Client Setup

```bash
$ ffmpeg -i /dev/video0 -video_size 800x600 -f flv rtmp://easypi.info/live/webcam
```

> Please try [easypi/rtmp-client-arm][2] on Raspberry Pi.

## Player Setup

```bash
# kodi
$ echo 'rtmp://easypi.info/live/webcam live=1' > ~/Movies/webcam.strm

# ffplay
$ brew reinstall ffmpeg --with-ffplay --with-rtmpdump
$ ffplay 'rtmp://easypi.info/live/webcam live=1'
```

## references

- <https://github.com/Red5/docker>
- <http://kodi.wiki/view/Internet_video_and_audio_streams>

[1]: https://github.com/Red5/red5-server
[2]: https://hub.docker.com/r/easypi/rtmp-client-arm/
