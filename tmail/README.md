twistd-mail
===========

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
