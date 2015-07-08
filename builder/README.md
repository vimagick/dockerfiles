tutum/builder
=============

A docker image that builds, tests and pushes docker images from code repositories.

## docker-compose.yml

```
builder:
  image: tutum/builder
  command: vimagick/test
  volumes:
    - ~/.dockercfg:/.dockercfg:ro
  environment:
    - GIT_REPO=https://github.com/vimagick/dockerfiles.git
    - DOCKERFILE_PATH=/test
  privileged: true
```

## build docker image

```
$ cd ~/fig/builder/
$ docker login
$ docker-compose run --rm -e DOCKERFILE_PATH=/tinc builder vimagick/tinc:latest
$ docker search vimagick/tinc
```
