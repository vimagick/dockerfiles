watchtower
==========

![](https://badge.imagelayers.io/centurylink/watchtower:latest.svg)

[`Watchtower`][1] is an application that will monitor your running Docker containers
and watch for changes to the images that those containers were originally
started from. If watchtower detects that an image has changed, it will
automatically restart the container using the new image.

## docker-compose.yml

```
watchtower:
  image: centurylink/watchtower
  command: >
    mysql
    mongo
    nginx
    redis
  volumes:
    - /var/run/docker.sock:/var/run/docker.sock
  restart: always
```

> It'll monitor all containers if no `command` in YAML.

## Up and Running

```
$ docker-compose up -d

$ docker-compose logs
watchtower_1 | time="2015-09-02T02:31:39Z" level=info msg="Checking containers for updated images"
watchtower_1 | time="2015-09-02T02:31:56Z" level=info msg="Found new redis:latest image (3d86...76)"
watchtower_1 | time="2015-09-02T02:31:56Z" level=info msg="Stopping /redis (8f51...f4) with SIGTERM"
watchtower_1 | time="2015-09-02T02:32:06Z" level=info msg="Starting /redis"
watchtower_1 | time="2015-09-02T02:37:06Z" level=info msg="Checking containers for updated images"
watchtower_1 | time="2015-09-02T02:42:10Z" level=info msg="Checking containers for updated images"
```

[1]: https://hub.docker.com/r/centurylink/watchtower/
