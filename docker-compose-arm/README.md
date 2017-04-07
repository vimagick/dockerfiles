docker-compose-arm
==================

Automated Build for Docker Compose on Raspberry Pi

## Quick Start

```bash
$ docker build -t easypi/docker-compose-arm .

$ docker run --name compose easypi/docker-compose-arm version
docker-compose version 1.12.0, build b31ff33
docker-py version: 2.2.1
CPython version: 3.4.2
OpenSSL version: OpenSSL 1.0.1t  3 May 2016

$ docker cp compose:/usr/local/bin/docker-compose .

$ file docker-compose
docker-compose: ELF 32-bit LSB executable, ARM, EABI5 version 1 (SYSV), dynamically linked, stripped

$ docker rm compose
compose
```
