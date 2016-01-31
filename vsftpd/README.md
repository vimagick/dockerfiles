vsftpd
======

[vsftpd][1] is a GPL licensed FTP server for UNIX systems, including Linux.
It is secure and extremely fast. It is stable. Don't take my word for it, though.

## Directory Tree

```
~/fig/vsftpd/
├── docker-compose.yml
├── ftp/
│   └── README.md
└── vsftpd/
    ├── vsftpd.conf
    └── vsftpd.pem
```

## vsftpd.conf

```bash
allow_writeable_chroot=YES
anonymous_enable=YES
chroot_local_user=YES
connect_from_port_20=YES
dirmessage_enable=YES
force_local_data_ssl=YES
force_local_logins_ssl=YES
ftpd_banner=Welcome to VSFTPD service.
listen=YES
local_enable=YES
pasv_addr_resolve=YES
pasv_address=my-ftp-server
pasv_enable=YES
pasv_max_port=30010
pasv_min_port=30000
port_enable=YES
rsa_cert_file=/etc/vsftpd/vsftpd.pem
rsa_private_key_file=/etc/vsftpd/vsftpd.pem
seccomp_sandbox=NO
ssl_enable=YES
ssl_sslv2=NO
ssl_sslv3=NO
ssl_tlsv1=YES
write_enable=YES
xferlog_enable=YES
```

> Please point `pasv_address` to your ftp server.

## docker-compose.yml

```yaml
vsftpd:
  image: vimagick/vsftpd
# net: host
  ports:
    - "20:20"
    - "21:21"
    - "30000-30010:30000-30010"
  volumes:
    - ./vsftpd:/etc/vsftpd
    - ./ftp:/var/lib/ftp
  privileged: true
  restart: always
```

> You can use `net: host` instead of `ports`.
> Make sure these ports are allowed by firewall.

## Server

```bash
$ cd ~/fig/vsftpd/
$ openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout vsftpd/vsftpd.pem -out vsftpd/vsftpd.pem
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
> I also added another local user called `kev` here.
> You can edit [/etc/vsftpd/vsftpd.conf][2] to enable more [functions][3].

## Client

You can login as `root`/`kev`(local user) or `ftp`(anonymous user).

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

Only local users can upload files.

```bash
$ lftp
lftp :~> set ssl:verify-certificate no
lftp :~> open root@my-ftp-server
Password: ******
lftp root@my-ftp-server:~> put README.md
lftp root@my-ftp-server:~> ls
-rw-------    1 0        0             337 Jan 31 16:26 README.md
lftp root@my-ftp-server:~> bye
```

[1]: https://security.appspot.com/vsftpd.html
[2]: http://vsftpd.beasts.org/vsftpd_conf.html
[3]: https://wiki.archlinux.org/index.php/Very_Secure_FTP_Daemon
