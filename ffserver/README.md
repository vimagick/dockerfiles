ffserver - FFserver video server
================================

`FFserver` is a streaming server for both audio and video. It supports
several live feeds, streaming from files and time shifting on live
feeds (you can seek to positions in the past on each live feed,
provided you specify a big enough feed storage in `ffserver.conf`).

## docker-compose.yml

```
ffserver:
  image: vimagick/ffserver
  ports:
    - "8090:8090"
  volumes:
    - ffserver.conf:/etc/ffserver.conf
    - data:/data
  restart: always
```

## ffserver.conf

```
HTTPPort 8090
HTTPBindAddress 0.0.0.0

MaxClients 100
MaxBandwidth 100000
CustomLog -

<Feed feed.ffm>
File /tmp/feed.ffm
</Feed>

<Stream feed.mp3>
Feed feed.ffm
Format mp2
AudioCodec libmp3lame
AudioBitRate 64
AudioChannels 1
AudioSampleRate 44100
NoVideo
</Stream>

<Stream status.html>
Format status
</Stream>
```

> WARNING: I've not figured out how to stream video yet!

## server

```
$ cd ~/fig/ffserver

$ tree
.
├── data
│   └── feed.mp4
├── docker-compose.yml
└── ffserver.conf

$ docker-compose up -d

$ docker exec ffserver_ffserver_1 ffmpeg -i /data/feed.mp3 http://localhost:8090/feed.ffm
```

## client

```
$ firefox http://server:8090/status.html

$ firefox http://server:8090/feed.mp4
```
