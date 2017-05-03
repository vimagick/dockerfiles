cmus
====

[cmus][1] is a small, fast and powerful console music player for Unix-like operating systems.


## docker-compose.yml

```yaml
cmus:
  image: vimagick/cmus
  ports:
    - "3000:3000"
  volumes:
    - ./data:/etc/cmus
    - ~/music:/root/music
  devices:
    - /dev/snd
  environment:
    - PASSWORD=secret
  tty: yes
  restart: unless-stopped
```

## up and running

```bash
$ docker-compose up -d
$ docker-compose exec cmus cmus-remote --help
$ docker-compose exec cmus cmus-remote --passwd secret
>>> clear
>>> add ~/music
>>> set continue=true
>>> set repeat=true
>>> set shuffle=true
>>> set resume=true
>>> player-play
>>> ^D
$ alsamixer
```

[1]: https://cmus.github.io/
