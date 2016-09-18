shoutcast
=========

![](https://upload.wikimedia.org/wikipedia/en/thumb/f/f7/SHOUTcast_logo.svg/200px-SHOUTcast_logo.svg.png)

[SHOUTcast][1] Server (DNAS) - The most popular online streaming server
software on the planet, used by over 50,000 broadcasters.

## How it works

```
+-----+       +-----------+
| mpd | ----> | shoutcast |
+-----+  PUB  +-----------+
                    ^
                    |SUB
           +--------+--------+
           |        |        |
        +-----+  +-----+  +-----+
        | mpd |  | mpd |  | mpd |
        +-----+  +-----+  +-----+
```

## docker-compose.yml

Server:

```yaml
shoutcast:
  image: vimagick/shoutcast
  ports:
    - "8000:8000"
    - "8001:8001"
  volumes:
    - ./sc_serv.conf:/opt/shoutcast/sc_serv.conf
  restart: always
```

Client:

```yaml
mpd:
  image: easypi/mpd-arm
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

## sc_serv.conf

```ini
#
# http://wiki.shoutcast.com/wiki/SHOUTcast_DNAS_Server_2
#

adminpassword=hackme1
password=hackme2
requirestreamconfigs=1
streamid_1=1
streampath_1=/stream/1/
logfile=logs/sc_serv.log
w3clog=logs/sc_w3c.log
banfile=control/sc_serv.ban
ripfile=control/sc_serv.rip
```

## nginx.conf

```
http {
    server {
        listen 80;
        server_name shoutcast.easypi.info;
        location / {
            proxy_pass http://127.0.0.1:8000;
        }
    }
}

stream {
    server {
        listen 81;
        proxy_pass 127.0.0.1:8001;
    }
}
```

## mpd.conf

```
music_directory    "/var/lib/mpd/music"
playlist_directory "/var/lib/mpd/playlists"
db_file            "/var/lib/mpd/database"
log_file           "/var/log/mpd/mpd.log"
pid_file           "/var/run/mpd.pid"
state_file         "/var/lib/mpd/state"
sticker_file       "/var/lib/mpd/sticker.sql"

input {
        plugin "curl"
}

audio_output {
        type            "alsa"
        name            "My ALSA Device"
        mixer_type      "software"
}

audio_output {
        type            "httpd"
        name            "My HTTP Stream"
        encoder         "vorbis"
        port            "8800"
        bitrate         "128"
        format          "44100:16:1"
        always_on       "yes"
        tags            "yes"
}

audio_output {
        type            "shout"
        protocol        "shoutcast"
        encoding        "mp3"
        name            "My Shout Stream"
        host            "shoutcast.easypi.info"
        port            "80"
        mount           "/stream/1/"
        password        "hackme2"
        bitrate         "128"
        format          "44100:16:1"
}
```

> `MPD` doesn't support `streampath` setting.
> The `mount` setting doesn't work.

```bash
$ export MPD_HOST=192.168.31.104
$ mpc update
$ mpc lsplaylists
$ mpc load playlist
$ mpc repeat on
$ mpc play
$ vlc http://shoutcast.easypi.info/stream/1/
```

[1]: http://wiki.shoutcast.com/wiki/SHOUTcast
