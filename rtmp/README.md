rtmp
====

- NGINX-based Media Streaming Server.
- FFMPGE-based Media Streaming Client.

## Directory Tree

```
~/fig/rtmp/
├── data/
│   └── video.mp4
├── docker-compose.yml
└── nginx/
    └── nginx.conf
```

## docker-compose.yml

```yaml
server:
  image: vimagick/nginx
  ports:
    - "1935:1935"
  volumes:
    - ./nginx/nginx.conf:/etc/nginx/nginx.conf
    - ./data:/data
  restart: always

client:
  image: vimagick/rtmp-client-arm
  devices:
    - /dev/video0:/dev/video0
  environment:
    - RTMP_RATE=10
    - RTMP_URI=rtmp://datageek.info/live/webcam
  restart: always
```

## Server

```
$ cd ~/fig/rtmp/
$ docker-compose up -d server
$ youtube-dl 'https://www.youtube.com/watch?v=lJZlz-WnXzU' -o data/video.mp4
```

## Client

```
# play remote video (remote -> local)
$ vlc rtmp://datageek.info/vod/video.mp4

# play local video (local -> remote -> local)
$ ffmpeg -re -i video.mp4 -f flv rtmp://datageek.info/live/video
$ vlc rtmp://datageek.info/live/video.mp4

# capture desktop (local -> remote)
$ ffmpeg -f avfoundation -pixel_format bgr0 -i 1:0 -f flv rtmp://datageek.info/live/webcam

# record webcam (local -> remote)
$ ffmpeg -f qtkit -i 0 -f flv rtmp://datageek.info/live/webcam

# record pi camera (pi -> remote)
$ ffmpeg -f video4linux2 -r 24 -i /dev/video0 -f flv rtmp://datageek.info/live/webcam

# record pi camera (pi -> remote)
$ /opt/vc/bin/raspivid -o - -t 0 -hf -w 640 -h 360 -fps 25 | ffmpeg -i - -f flv rtmp://datageek.info/live/webcam

# watch webcam (remote -> local)
$ vlc rtmp://datageek.info/live/webcam
```

Optinally, you can run a docker container as RTMP client on raspberry pi.

```
$ cd ~/fig/rtmp/
$ docker-compose up -d client
```

## References

- https://github.com/arut/nginx-rtmp-module/wiki/Directives
- https://trac.ffmpeg.org/wiki/StreamingGuide
- https://trac.ffmpeg.org/wiki/Capture/Webcam
