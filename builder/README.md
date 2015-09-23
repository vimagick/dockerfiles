tutum/builder
=============

A docker image that builds, tests and pushes docker images from code repositories.

## docker-compose.yml

```
builder:
  image: tutum/builder
  volumes:
    - ~/.docker:/.docker:ro
  environment:
    - GIT_REPO=https://github.com/vimagick/dockerfiles.git
    - DOCKERFILE_PATH=/test
    - IMAGE_NAME=vimagick/test:latest
  privileged: true
```

- If `IMAGE_NAME` not specified, it will be built and tested, but not pushed.
- [Hooks][1] in `$DOCKERFILE_PATH/hooks/` will be executed before and after each step.

## build docker image

```
$ cd ~/fig/builder/
$ docker login
$ docker-compose run --rm -e DOCKERFILE_PATH=/tinc -e IMAGE_NAME=vimagick/tinc builder
$ docker search vimagick/tinc
```

[1]: https://github.com/tutumcloud/builder#hooks
