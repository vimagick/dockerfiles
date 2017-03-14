pure-ftpd
=========

![](https://www.pureftpd.org/images/pure-ftpd.png)

[Pure-FTPd][1] is a free (BSD), secure, production-quality and standard-conformant
FTP server. It doesn't provide useless bells and whistles, but focuses on
efficiency and ease of use. It provides simple answers to common needs, plus
unique useful features for personal users as well as hosting providers. 


## ~/fig/pureftpd/docker-compose.yml

```yaml
pureftpd:
  image: vimagick/pure-ftpd
  ports:
    - "21:21"
  volumes:
    - ./data/ftpuser:/home/ftpuser
    - ./data/pure-ftpd:/etc/pure-ftpd
  privileged: true
  restart: always
```

> We only need to expose port `21` to accept client ftp connection.
> Pure-FTPd will open random port to accept client ftp-data connection.
> At this time, host machine is a router for DNAT.

## server

```bash
$ cd ~/fig/pureftpd/
$ docker-compose up -d
$ docker-compose exec pureftpd bash
>>> pure-pw useradd kev -u ftpuser -d /home/ftpuser/kev -t 1024 -T 1024 -y 1 -m
>>> pure-pw list
>>> pure-pw show kev
>>> pure-pw passwd kev -m
>>> pure-pw userdel kev -m
>>> pure-ftpwho -n
>>> exit
$ tree -F
.
├── docker-compose.yml
└── data/
    ├── ftpuser/
    │   └── kev/
    │       └── file.txt
    └── pure-ftpd/
        ├── pureftpd.passwd
        └── pureftpd.pdb
```

## client

```bash
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

[1]: https://www.pureftpd.org/project/pure-ftpd
