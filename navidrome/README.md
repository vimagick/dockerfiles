navidrome
=========

[Navidrome][1] is an open source web-based music collection server and
streamer. It gives you freedom to listen to your music collection from any
browser or mobile device. It's like your personal Spotify!

## up and running

```bash
$ mkdir -p data music
$ chown -R 1000:1000 data music
$ docker-compose up -d
$ curl http://127.0.0.1:4533
```

[1]: https://github.com/navidrome/navidrome
