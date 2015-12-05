ngrokd
======

![](https://badge.imagelayers.io/vimagick/ngrokd:latest.svg)

[ngrok][1] is a reverse proxy that creates a secure tunnel from a public endpoint to
a locally running web service. ngrok captures and analyzes all traffic over the
tunnel for later inspection and replay.

## docker-compose.yml

```
data:
  build: .
  entrypoint: /bin/true

service:
  image: debian:jessie
  command: >
    ./ngrokd
    -domain=ngrok.foobar.site
    -httpAddr=:2080
    -httpsAddr=:2443
    -tunnelAddr=:4443
    -tlsCrt=snakeoil.crt
    -tlsKey=snakeoil.key
    -log-level=INFO
  ports:
    - "2080:2080"
    - "2443:2443"
    - "4443:4443"
  volumes:
    - ./ngrok:/ngrok
  working_dir: /ngrok
  restart: always
```

## up and running

```
$ mkdir -p ~/fig/ngrokd/
$ cd ~/fig/ngrokd/
$ wget https://github.com/vimagick/dockerfiles/raw/master/ngrokd/docker-compose.yml
$ wget https://github.com/vimagick/dockerfiles/raw/master/ngrokd/Dockerfile
$ vim Dockerfile

$ docker-compose build data
$ docker-compose up -d data
$ docker cp ngrokd_data_1:/ngrok .
$ docker-compose rm -v data

$ docker-compose up -d service
$ docker-compose logs service
```

## important notes

- [vimagick/ngrokd][2] should not be used directly
- Change `NGROK_BASE_DOMAIN` in [Dockerfile][3]
- Nerver push it to public repo

[1]: https://github.com/inconshreveable/ngrok
[2]: https://hub.docker.com/r/vimagick/ngrokd/
[3]: https://github.com/vimagick/dockerfiles/raw/master/ngrokd/Dockerfile#L9
