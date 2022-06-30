Music Player Daemon
===================

[Music Player Daemon][1] (MPD) is a flexible, powerful, server-side application
for playing music. Through plugins and libraries it can play a variety of sound
files while being controlled by its network protocol.

:+1: [easypi/mpd-arm][2] works on Raspberry Pi very well.

## docker-compose.yml

```yaml
version: "3.8"

services:

  mpd:
    image: vimagick/mpd
    ports:
      - "6600:6600"
      - "8800:8800"
    volumes:
      - ./data/config:/root/.config
      - ./data/music:/var/lib/mpd/music
      - ./data/playlists:/var/lib/mpd/playlists
    devices:
      - /dev/snd
    restart: unless-stopped
```

## Server Setup

```bash
$ mkdir -p ~/fig/mpd/{config,music,playlists}
$ cd ~/fig/mpd/

$ wget https://upload.wikimedia.org/wikipedia/commons/d/d5/Pop_Goes_the_Weasel.ogg -O data/music/test.ogg

# FIXME: OUTDATED
$ curl -s -X POST -H 'Content-Length: 0' http://www.shoutcast.com/Home/Top |
    jq '.[].ID' |
      parallel --eta -k curl -s 'http://yp.shoutcast.com/sbin/tunein-station.m3u?id={}' |
        sed '1!s@#EXTM3U@@' |
          cat -s > data/playlists/shoutcast.m3u

$ cat > data/playlists/microphone.m3u << _EOF_
#EXTM3U
#EXTINF:-1,microphone
alsa://plughw:1,0
_EOF_

$ docker-compose up -d

$ docker-compose exec mpd sh
>>> mpc help
>>> mpc update
>>> mpc ls | mpc add
>>> mpc playlist
>>> mpc repeat on
>>> mpc random on
>>> mpc
>>> mpc clear
>>> mpc lsplaylists
>>> mpc load shoutcast
>>> mpc play
>>> exit

$ docker-compose exec mpd ncmpcpp
...........
...........
... TUI ...
...........
...........
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
- <https://www.musicpd.org/doc/user/input_plugins.html>

[1]: https://www.musicpd.org/
[2]: https://hub.docker.com/r/easypi/mpd-arm/
