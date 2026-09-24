samba
=====

[Samba][1] is the standard Windows interoperability suite of programs for
Linux and Unix.

## mnt-usb.mount

An USB flash drive is mounted at `/mnt/usb`.

```ini
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

```ini
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

```bash
$ cd ~/fig/samba
$ mkdir -m 777 -p data/{etc,log,mnt,var}
$ touch data/mnt/README.txt
$ docker compose up -d
$ docker compose exec samba sh
>>> testparm
>>> smbpasswd -a root
New SMB password:******
Retype new SMB password:******
>>> exit
```

## client

```bash
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

> `root` user can read and write, `guest` user read-only.

[1]: https://www.samba.org/
