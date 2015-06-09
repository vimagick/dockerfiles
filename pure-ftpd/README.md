`Pure-FTPd` is a free (BSD), secure, production-quality and standard-conformant
FTP server. It doesn't provide useless bells and whistles, but focuses on
efficiency and ease of use. It provides simple answers to common needs, plus
unique useful features for personal users as well as hosting providers. 


## ~/fig/pureftpd/docker-compose.yml

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

## server

```
$ cd ~/fig/pureftpd/
$ fig up -d
$ fig ps
$ docker exec -it pureftpd_pureftpd_1 bash
>>> pure-pw useradd kev -u ftpuser -d /home/ftpuser/kev -t 1024 -T 1024 -y 1 -m
>>> pure-pw list
>>> pure-pw show kev
>>> pure-pw passwd kev -m
>>> pure-pw userdel kev -m
>>> pure-ftpwho -n
```

## client

```
$ ftp remote-server
Name: kev
Password: ******
ftp> !touch file.txt
ftp> !ls
ftp> put file.txt
ftp> !rm file.txt
ftp> get file.txt
ftp> del file.txt
ftp> ls
ftp> bye
```
