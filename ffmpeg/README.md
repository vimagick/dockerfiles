ffmpeg
======

![](https://badge.imagelayers.io/vimagick/ffmpeg:latest.svg)

## Tutorial

```
# create an alias
$ alias ffmpeg='docker run --rm -u $(id -u):$(id -g) -v $PWD:/data vimagick/ffmpeg'

# do video transcoding
$ ffmpeg -i video.mov video.mp4
```
