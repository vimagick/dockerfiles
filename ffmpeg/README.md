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

## Todo List

- [ ] Re-compile with fontconfig/freetype enabled to support [timestamp][2] overlay.

[1]: http://ffmpeg.org/
[2]: https://einar.slaskete.net/2011/09/05/adding-time-stamp-overlay-to-video-stream-using-ffmpeg/
