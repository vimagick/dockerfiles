alpine-arm
==========

:warning: This project has been moved to [here][1]!

![](https://badge.imagelayers.io/vimagick/alpine-arm:latest.svg)

## Make Images

```
$ docker login

$ make RELEASE=edge
$ make test RELEASE=edge
$ make push RELEASE=edge
$ make clean

$ make RELEASE=v3.3
$ make test RELEASE=v3.3
$ make push RELEASE=v3.3
$ make clean

$ make latest RELEASE=v3.3
$ make test RELEASE=latest
$ make push RELEASE=latest
```

[1]: https://github.com/EasyPi/alpine-arm
