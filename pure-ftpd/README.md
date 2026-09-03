pure-ftpd
=========

![](https://www.pureftpd.org/images/pure-ftpd.png)

[Pure-FTPd][1] is a free (BSD), secure, production-quality and standard-conformant
FTP server. It doesn't provide useless bells and whistles, but focuses on
efficiency and ease of use. It provides simple answers to common needs, plus
unique useful features for personal users as well as hosting providers. 

## server

```bash
$ cd ~/fig/pure-ftpd/
$ docker-compose up -d
$ docker-compose exec pure-ftpd sh
>>> pure-pw useradd kev -u ftpuser -d /home/ftpuser/kev -t 1024 -T 1024 -y 1 -m
# Password: ******
# Enter it again: ******
>>> pure-pw list
>>> pure-pw show kev
>>> pure-pw passwd kev -m
>>> pure-pw userdel kev -m
>>> pure-ftpwho -n
>>> exit
$ tree -F
├── docker-compose.yml
└── data/
    ├── var/
    │   └── kev/
    │       └── file.txt
    └── etc/
        ├── pureftpd.passwd
        └── pureftpd.pdb
```

## Client (Active Mode)

> It only works in LAN environment

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

## Client (Passive Mode)

> Please config firewall according to [PassivePortRange][2] (-p first:last -P address).

```bash
$ curl -u kev:****** -T file.txt ftp://remote-server/
curl: (7) Failed to connect to remote-server:21 via remote-server:20015 after 5801 ms: Could not connect to server
```

To fix this issue:

- You need to add two options: `-p 20000:20099 -P x.x.x.x` and expose these ports to host
- Alternatively, you can use `network_mode: host`

[1]: https://www.pureftpd.org/project/pure-ftpd
[2]: https://linux.die.net/man/8/pure-ftpd
