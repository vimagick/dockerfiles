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
    - "8800:8800"
  volumes:
    - ./mpd.conf:/etc/mpd.conf
    - ./music:/var/lib/mpd/music
    - ./playlists:/var/lib/mpd/playlists
  devices:
    - /dev/snd
  restart: always
```

## Server Setup

```bash
$ cd ~/fig/mpd/
$ mkdir -p music playlists
$ wget https://upload.wikimedia.org/wikipedia/commons/d/d5/Pop_Goes_the_Weasel.ogg -O music/song.ogg
$ curl -s -X POST -H 'Content-Length: 0' http://www.shoutcast.com/Home/Top |
    jq '.[].ID' |
      parallel --eta -k curl -s 'http://yp.shoutcast.com/sbin/tunein-station.m3u?id={}' |
        sed '1!s@#EXTM3U@@' |
          cat -s > playlists/shoutcast.m3u
$ docker-compose up -d
```

## Client Setup

- Android: https://play.google.com/store/apps/details?id=com.namelessdev.mpdroid
- Desktop: http://rybczak.net/ncmpcpp/

```yaml
Host: x.x.x.x
Port: 6600
Streaming host: x.x.x.x
Streaming port: 8800
```

## Read More

- <https://wiki.archlinux.org/index.php/Music_Player_Daemon>
- <https://wiki.archlinux.org/index.php/Music_Player_Daemon/Tips_and_tricks>
- <https://wiki.archlinux.org/index.php/Streaming_With_Icecast>
- <https://stmllr.net/blog/streaming-audio-with-mpd-and-icecast2-on-raspberry-pi/>

[1]: https://www.musicpd.org/
