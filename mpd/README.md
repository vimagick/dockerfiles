Music Player Daemon
===================

[Music Player Daemon][1] (MPD) is a flexible, powerful, server-side application
for playing music. Through plugins and libraries it can play a variety of sound
files while being controlled by its network protocol.


## docker-compose.yml

```yaml
mpd:
  image: vimagick/mpd
  ports:
    - "6600:6600"
  volumes:
    - ./music:/var/lib/mpd/music
    - ./playlists:/var/lib/mpd/playlists
  devices:
    - /dev/snd
  restart: always
```

## Server Setup

```bash
$ mkdir -p music playlists
$ wget https://upload.wikimedia.org/wikipedia/commons/d/d5/Pop_Goes_the_Weasel.ogg -O music/song.ogg
$ wget http://yp.shoutcast.com/sbin/tunein-station.m3u?id=760782 -O playlists/760782.m3u
$ docker-compose up -d
```

## Client Setup

- Android: https://play.google.com/store/apps/details?id=com.namelessdev.mpdroid
- Desktop: http://rybczak.net/ncmpcpp/

## Read More

- <https://wiki.archlinux.org/index.php/Music_Player_Daemon>
- <https://wiki.archlinux.org/index.php/Streaming_With_Icecast>
- <https://stmllr.net/blog/streaming-audio-with-mpd-and-icecast2-on-raspberry-pi/>

[1]: https://www.musicpd.org/
