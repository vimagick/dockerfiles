samba
=====

![](https://badge.imagelayers.io/vimagick/samba:latest.svg)

[Samba][1] is the standard Windows interoperability suite of programs for
Linux and Unix.

## docker-compose.yml

```
samba:
  image: vimagick/samba
  volumes:
    - ./smb.conf:/etc/samba/smb.conf
    - ./share:/share
  net: host
  restart: always
```

## smb.conf

```
[global]
workgroup = WORKGROUP
netbios name = EasyPi
server string = Samba Server
map to guest = bad user

[share]
path = /share
browseable = yes
read only = no
guest ok = yes
admin users = root
```

## server

```
$ cd ~/fig/samba
$ mkdir share
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
$ smbutil view -NG smb://easypi
Share                                           Type    Comments
-------------------------------
share                                           Disk
IPC$                                            Pipe    IPC Service (Samba Server)
2 shares listed

$ mkdir -p /Volumes/share
$ mount_smbfs //guest@easypi/share /Volumes/share
$ umount /Volumes/share
```

> `root` user can read and write, `guest` user can read only.

[1]: https://www.samba.org/
