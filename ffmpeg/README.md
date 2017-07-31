ffmpeg
======

![](https://badge.imagelayers.io/vimagick/ffmpeg:latest.svg)

[FFmpeg][1] is a complete, cross-platform solution to record, convert and stream audio and video.

## Tutorial

```bash
# Create an alias
$ alias ffmpeg='docker run --rm -u $(id -u):$(id -g) -v $PWD:/data vimagick/ffmpeg'

# Do video transcoding
$ ffmpeg -i video.mov video.mp4
```

## YouTube Live Streaming

```yaml
ffmpeg:
  image: vimagick/ffmpeg
  entrypoint: sh
  command:
    - -c
    - ffmpeg -f lavfi -i anullsrc -rtsp_transport udp -i $$RTMP_DEV -tune zerolatency -vcodec mpeg4 -pix_fmt + -c:v copy -an -f flv $$RTMP_URI
  environment:
    - RTMP_DEV=rtsp://10.50.254.197/live
    - RTMP_URI=rtmp://a.rtmp.youtube.com/live2/xxxx-xxxx-xxxx-xxxx
  restart: always
```

## Todo List

- [ ] Re-compile with fontconfig/freetype enabled to support [timestamp][2] overlay.

[1]: http://ffmpeg.org/
[2]: https://einar.slaskete.net/2011/09/05/adding-time-stamp-overlay-to-video-stream-using-ffmpeg/
