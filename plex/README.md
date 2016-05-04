plex
====

The free [Plex Media Server][1] simplifies your life by organizing all of your
personal media, making it beautiful and streaming it to all of your devices.

## docker-compose.yml

```yaml
plex:
  image: vimagick/plex
  volumes:
    - "./data:/data:ro"
    - "./data/plex:/var/lib/plexmediaserver/Library/Application Support"
  environment:
    - "HOME=/data"
  working_dir: /data
# user: 1000:1000
  net: host
  restart: always
```

> Please uncomment `user: UID:GID` if you're not the `root` user.

## up and running

```bash
$ cd ~/fig/plex/
$ mkdir -p data/{plex,Movies,Music,Photos}
$ echo "$(id -u):$(id -g)"
$ vim docker-compose.yml
$ docker-compose up -d
$ firefox http://localhost:32400/web
```

[1]: https://plex.tv/
