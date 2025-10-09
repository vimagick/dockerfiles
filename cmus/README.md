cmus
====

[cmus][1] is a small, fast and powerful console music player for Unix-like operating systems.


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
