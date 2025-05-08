go2rtc
======

[go2rtc][1] is a ultimate camera streaming application with support RTSP, RTMP,
HTTP-FLV, WebRTC, MSE, HLS, MP4, MJPEG, HomeKit, FFmpeg, etc.

## up and running

```bash
$ mkdir -p data
$ wget -P data https://download.blender.org/peach/bigbuckbunny_movies/BigBuckBunny_320x180.mp4
$ vi data/go2rtc.yaml
$ docker compose up -d
$ curl 'http://127.0.0.1:1984/api/frame.jpeg?src=bunny' -o output.jpeg
$ curl 'http://127.0.0.1:1984/api/stream.mp4?src=bunny&duration=15' -o output.mp4
```

[1]: https://github.com/AlexxIT/go2rtc
