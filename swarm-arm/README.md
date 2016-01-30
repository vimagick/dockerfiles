swarm-arm
=========

![](https://badge.imagelayers.io/vimagick/swarm-arm:latest.svg)

- https://docs.docker.com/swarm/install-manual/
- https://docs.docker.com/swarm/discovery/
- https://github.com/docker/swarm-library-image

```bash
# on master
$ docker run --rm vimagick/swarm-arm create
f9723931d522b39b756bb0b24a7cfc04

# on slave 1
$ docker run -d --restart always vimagick/swarm-arm join --addr=192.168.1.204:2375 token://f9723931d522b39b756bb0b24a7cfc04

# on slave 2
$ docker run -d --restart always vimagick/swarm-arm join --addr=192.168.1.204:2375 token://f9723931d522b39b756bb0b24a7cfc04

# on slave 3
$ docker run -d --restart always vimagick/swarm-arm join --addr=192.168.1.204:2375 token://f9723931d522b39b756bb0b24a7cfc04

# on master
$ curl https://discovery.hub.docker.com/v1/clusters/f9723931d522b39b756bb0b24a7cfc04
$ docker run --rm vimagick/swarm-arm list token://f9723931d522b39b756bb0b24a7cfc04
$ docker run -d --restart always -p 2375:2375 vimagick/swarm-arm manage token://f9723931d522b39b756bb0b24a7cfc04
$ export DOCKER_HOST=tcp://127.0.0.1:2375
$ docker info
```

> Any host can be a master as long as it can reach slaves!
