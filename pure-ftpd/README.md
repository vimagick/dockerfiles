`Pure-FTPd` is a free (BSD), secure, production-quality and standard-conformant
FTP server. It doesn't provide useless bells and whistles, but focuses on
efficiency and ease of use. It provides simple answers to common needs, plus
unique useful features for personal users as well as hosting providers. 


## docker-compose.yml

```
pureftpd:
  image: vimagick/pure-ftpd
  ports:
    - "21:21"
  volumes:
    - ftpuser:/home/ftpuser
    - pure-ftpd:/etc/pure-ftpd
  privileged: true
  restart: always
```
