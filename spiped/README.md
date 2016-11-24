spiped
======

## docker-compose.yml

```yaml
keygen:
  image: spiped:alpine
  command: spiped-generate-key.sh
  volumes:
    - ./key:/spiped/key/spiped-keyfile

server:
  image: spiped:alpine
  command: -d -s 0.0.0.0:5353 -t 8.8.8.8:53
  ports:
    - "5353:5353"
  volumes:
    - ./key:/spiped/key:ro
  restart: always

client:
  image: spiped:alpine
  command: -e -s 0.0.0.0:5533 -t 1.2.3.4:5353
  ports:
    - "5533:5533"
  volumes:
    - ./key:/spiped/key:ro
  restart: always
```

## up and running

```bash
$ mkdir -p ~/fig/spiped
$ cd ~/fig/spiped
$ touch key
$ docker-compose run --rm keygen
$ docker-compose up -d server
$ docker-compose up -d client
$ dig -p 53 @8.8.8.8 +tcp www.google.com
$ dig -p 5533 @127.0.0.1 +tcp www.google.com
```

> Please run server and client on different machines.
