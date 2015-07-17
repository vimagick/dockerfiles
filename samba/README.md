samba
=====

![](https://badge.imagelayers.io/vimagick/samba:latest.svg)

[`Samba`][1] is the standard Windows interoperability suite of programs for
Linux and Unix.

## docker-compose.yml

```
samba:
  image: vimagick/samba
  ports:
    - "137:137/udp"
    - "138:138/udp"
    - "139:139/tcp"
    - "445:445/tcp"
  volumes:
    - smb.conf:/etc/samba/smb.conf
    - share:/share
  restart: always
```

## smb.conf

```
[global]
workgroup = WORKGROUP
server string = %h server (Samba, Apline)

[share]
path = /share
browseable = yes
read only = yes
guest ok = yes
```

## server

```
$ cd ~/fig/samba
$ mkdir share
$ chmod 777 share
$ touch share/README.txt
$ docker-compose up -d
$ docker exec -it samba_samba_1 sh
>>> smbpasswd -a root
New SMB password:******
Retype new SMB password:******
>>> exit
```

## client

```
$ smbutil view smb://server
```

[1]: https://www.samba.org/
