twistd-mail
===========

An SMTP / POP3 email server plugin for twistd.

## docker-compose.yml

```
tmail:
  image: vimagick/tmail
  ports:
    - "25:25"
    - "110:110"
  volumes:
    - mail:/var/mail
  environment:
    - MAIL_NAME=domain.org
    - MAIL_PATH=/var/mail
    - MAIL_USER=user
    - MAIL_PASS=pass
  restart: always
```

> You can pass additional arguments via environment variable `MAIL_OPTS`:
>> `MAIL_OPTS=--user=admin=admin`

## server

```
$ docker-compose up -d
```

## client

- POP3: domain.org:110
- USER: user@domain.org
- PASS: pass

## todo

- [x] receive email via pop3
- [ ] send email via smtp

