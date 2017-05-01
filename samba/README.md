samba
=====

![](https://badge.imagelayers.io/vimagick/samba:latest.svg)

[Samba][1] is the standard Windows interoperability suite of programs for
Linux and Unix.

## docker-compose.yml

```yaml
samba:
  image: vimagick/samba
  volumes:
    - ./data/smb.conf:/etc/samba/smb.conf
    - ./share:/share
  net: host
  tty: yes
  restart: always
```

> Uncomment to use a customized config file.

## mnt-usb.mount

An USB flash drive is mounted at `/mnt/usb`.

```
# /etc/systemd/system/mnt-usb.mount
[Unit]
Description=USB Storage Mount

[Mount]
What=/dev/disk/by-uuid/829B-2038
Where=/mnt/usb

[Install]
WantedBy=local-fs.target
```

## smb.conf

```
[global]
netbios name = easypi
workgroup = WORKGROUP
server string = EasyPi Samba Server
server role = standalone
map to guest = bad user
usershare allow guests = yes

[homes]
comment = Home Directories
browseable = no
writable = yes

[share]
comment = Public File Sharing
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
>>> testparm
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
