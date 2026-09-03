pure-ftpd
=========

![](https://www.pureftpd.org/images/pure-ftpd.png)

[Pure-FTPd][1] is a free (BSD), secure, production-quality and standard-conformant
FTP server. It doesn't provide useless bells and whistles, but focuses on
efficiency and ease of use. It provides simple answers to common needs, plus
unique useful features for personal users as well as hosting providers. 

## Server

```bash
$ cd ~/fig/pure-ftpd/
$ mkdir -p data/{etc,ssl,var,log}
$ cd data/ssl/
$ openssl req -x509 -nodes -days 365 -newkey rsa:2048 -sha256 \
    -subj "/CN=localhost" \
    -keyout pure-ftpd.pem \
    -out pure-ftpd.pem \
    -outform PEM
$ cd ../../

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
    ├── log/
    │   └── pureftpd.log
    ├── ssl/
    │   └── pure-ftpd.pem
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

## Enforce TLS (-Y3, --tls=3)

- With "--tls=0", support for TLS is disabled. This is the default.
- With "--tls=1", clients can connect either the traditional way or through an TLS layer.
  This is probably the setting you need if you want to enable TLS without having too many angry customers.
- With "--tls=2", cleartext sessions are refused and only TLS compatible clients are accepted.
- With "--tls=3", cleartext sessions are refused and only TLS compatible clients are accepted.
  Clear data connections are also refused, so private data connections are enforced. This is an extreme setting.

Update docker-compose.yml

```yaml
services:
  pure-ftpd:
    image: easypi/pure-ftpd
    command: ["-A", "-E", "-H", "-j", "-Y3"]
```

```bash
$ curl -k --ssl-reqd -u kev:****** ftp://remote-server/file.txt
```

## Specified GID without Chroot (-a21, --trustedgid=21)

Update docker-compose.yml

```yaml
services:
  pure-ftpd:
    image: easypi/pure-ftpd
    command: ["-A", "-E", "-H", "-j", "-Y3", "-a21"]
```

```bash
$ docker-compose exec pure-ftpd sh
>>> cat /etc/groups
>>> getent group 21
>>> pure-pw useradd admin -u ftpuser -g 21 -D /home/ftpuser/admin -m
# Password: ******
# Enter it again: ******
>>> exit

$ cat ~/.lftprc
set ssl:ca-file ~/fig/pure-ftpd/data/ssl/pure-ftpd.pem

$ lftp -u admin,***** localhost
>>> ls
>>> pwd
ftp://admin:******@localhost/%2Fhome/ftpuser/admin
>>> debug 3
>>> cat -b ../kev/file.txt
>>> bye
```

[1]: https://www.pureftpd.org/project/pure-ftpd
[2]: https://linux.die.net/man/8/pure-ftpd
