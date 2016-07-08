rtmp
====

- NGINX-based Media Streaming Server.
- FFMPGE-based Media Streaming Client.

## Directory Tree

```
~/fig/rtmp/
├── data/
│   └── video.mp4
└── docker-compose.yml
```

## docker-compose.yml

```yaml
server:
  image: vimagick/rtmp-server
  ports:
    - "1935:1935"
    - "9999:80"
  volumes:
    - ./data:/data
  restart: always

client:
  image: easypi/rtmp-client-arm
# command:
#   - ffmpeg -i $$RTMP_DEV -video_size 800x600 -vf "hflip,vflip" -f flv $$RTMP_URI
#   - ffmpeg -f alsa -ac 1 -ar 22050 -i hw:1 -i $$RTMP_DEV -c:a aac -c:v flv1 -f flv $$RTMP_URI
  devices:
#   - /dev/snd
    - /dev/video0
  environment:
#   - RTMP_DEV=rtsp://192.168.42.1/live
    - RTMP_URI=rtmp://easypi.info/live/webcam
  restart: always
```

> - You can run customized command. (It should be single item list!)
> - Input can be a stream instead of device. (It works as a relay!)

## Server Setup

```
$ cd ~/fig/rtmp/
$ docker-compose up -d server
$ youtube-dl 'https://www.youtube.com/watch?v=lJZlz-WnXzU' -o data/video.mp4
```

## Client Setup

```
# play remote video (remote -> local)
$ vlc rtmp://easypi.info/vod/video.mp4

# play local video (local -> remote -> local)
$ ffmpeg -re -i video.mp4 -f flv rtmp://easypi.info/live/video
$ vlc rtmp://easypi.info/live/video

# capture desktop (local -> remote)
$ ffmpeg -f avfoundation -pixel_format bgr0 -i 1:0 -f flv rtmp://easypi.info/live/webcam

# record webcam (local -> remote)
$ ffmpeg -f qtkit -i 0 -f flv rtmp://easypi.info/live/webcam

# record pi camera (pi -> remote)
$ ffmpeg -f video4linux2 -r 24 -i /dev/video0 -f flv rtmp://easypi.info/live/webcam

# record pi camera (pi -> remote)
$ /opt/vc/bin/raspivid -o - -t 0 -hf -w 640 -h 360 -fps 25 | ffmpeg -i - -f flv rtmp://easypi.info/live/webcam

# watch webcam (remote -> local)
$ vlc rtmp://easypi.info/live/webcam

# watch webcam (remote -> local)
$ firefox http://easypi.info:9999/
```

Optinally, you can run a docker container as RTMP client on raspberry pi.

```
$ cd ~/fig/rtmp/
$ docker-compose up -d client
```

## OBS Setup

```yaml
Stream Type: Custom Streaming Server
URL: rtmp://192.168.31.254/live/
Streaming key: webcam
```

## Player Setup

- vlc
- ffplay
- [online](https://www.hlsplayer.net/rtmp-player)

## References

- https://github.com/arut/nginx-rtmp-module/wiki/Directives
- https://trac.ffmpeg.org/wiki/StreamingGuide
- https://trac.ffmpeg.org/wiki/Capture/Webcam
- https://trac.ffmpeg.org/wiki/Capture/ALSA
- https://trac.ffmpeg.org/wiki/EncodingForStreamingSites
- http://apk-dl.com/vlc-for-android/org.videolan.vlc/
