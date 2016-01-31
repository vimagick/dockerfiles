vsftpd
======

[vsftpd][1] is a GPL licensed FTP server for UNIX systems, including Linux.
It is secure and extremely fast. It is stable. Don't take my word for it, though.

## docker-compose.yml

```yaml
vsftpd:
  image: vimagick/vsftpd
  ports:
    - "21:21"
  volumes:
    - ./ftp:/var/lib/ftp
  privileged: true
  restart: always
```

## Server

```bash
$ cd ~/fig/vsftpd/
$ docker-compose up -d
$ touch ./ftp/README.md
$ docker exec -it vsftpd_vsftpd_1 sh
>>>
>>> passwd root
Changing password for root
New password: ******
Retype password: ******
Password for root changed by root
>>>
>>> adduser kev
Changing password for kev
New password: ******
Retype password: ******
Password for kev changed by root
>>>
>>> exit
```

> :warning: Default password for `root` is empty, please change it!
> I also add another local user called `kev` here.
> You can edit [/etc/vsftpd/vsftpd.conf][2] to enable more functions.

## Client

You can login as `root`/`kev`(local user) or `ftp`(anonymous user).
Only local users can upload files.

```bash
$ ftp my-ftp-server
Connected to my-ftp-server.
220 Welcome to VSFTPD service.
Name (my-ftp-server:kev): ftp
331 Please specify the password.
Password: 
230 Login successful.
Remote system type is UNIX.
Using binary mode to transfer files.

ftp> epsv4 off
EPSV/EPRT on IPv4 off.

ftp> passive off
Passive mode: off; fallback to active mode: off.

ftp> verbose off
Verbose mode off.

ftp> ls
-rw-r--r--    1 0        0               0 Jan 31 15:06 README.md

ftp> get README.md
     0        0.00 KiB/s

ftp> !cat README.md

ftp> put README.md
Permission denied.

ftp> bye
```

> :warning: Passive mode is not working!

[1]: https://security.appspot.com/vsftpd.html
[2]: https://wiki.archlinux.org/index.php/Very_Secure_FTP_Daemon
