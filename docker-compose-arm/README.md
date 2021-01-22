docker-compose-arm
==================

Automated Build for Docker Compose on Raspberry Pi

## Quick Start

```bash
$ docker build -t easypi/docker-compose-arm .

$ docker run --name compose easypi/docker-compose-arm version
docker-compose version 1.28.0, build
docker-py version: 4.4.1
CPython version: 3.7.3
OpenSSL version: OpenSSL 1.1.1d  10 Sep 2019

$ docker cp compose:/usr/local/bin/docker-compose .

$ file docker-compose
docker-compose: ELF 32-bit LSB executable, ARM, EABI5 version 1 (SYSV), dynamically linked, stripped

$ docker rm compose
compose
```
