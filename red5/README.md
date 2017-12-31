red5
====

![](https://badge.imagelayers.io/vimagick/red5-server:latest.svg)

[Red5][1] is an Open Source Flash Server written in Java.

## docker-compose.yml

```yaml
red5:
  image: vimagick/red5
  ports:
    - "1935:1935"
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
# no watermark
$ ffmpeg -i /dev/video0 -video_size 800x600 -b 512k -f flv rtmp://easypi.pro/live/webcam

# with watermark (top right with 10px padding)
$ ffmpeg -i /dev/video0 -video_size 800x600 -vf "drawtext=fontfile=/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf:expansion=strftime:text='\%F^L    \%T':fontcolor=white@0.8:x=w-tw-10:y=10" -b 512k -f flv rtmp://easypi.pro/live/webcam
```

> Note: `^L` was typed via pressing `Ctrl-V` + `Ctrl-L`

Please try [easypi/rtmp-client-arm][2] on Raspberry Pi.

## Player Setup

```bash
# kodi
$ echo 'rtmp://easypi.pro/live/webcam live=1' > ~/Movies/webcam.strm

# ffplay
$ brew reinstall ffmpeg --with-ffplay --with-rtmpdump
$ ffplay 'rtmp://easypi.pro/live/webcam live=1'
```

## references

- <https://github.com/Red5/docker>
- <http://kodi.wiki/view/Internet_video_and_audio_streams>

[1]: https://github.com/Red5/red5-server
[2]: https://hub.docker.com/r/easypi/rtmp-client-arm/
