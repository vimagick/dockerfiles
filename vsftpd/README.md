vsftpd
======

[vsftpd][1] is a GPL licensed FTP server for UNIX systems, including Linux.
It is secure and extremely fast. It is stable. Don't take my word for it, though.

## Directory Tree

```
~/fig/vsftpd/
├── docker-compose.yml
├── ftp/
│   └── README
├── pam.d/
│   └── vsftpd          => For Virutal User
└── vsftpd/
    ├── passwd          => For Virtual User
    ├── vsftpd.conf
    └── vsftpd.pem      => For SSL
```

## vsftpd/vsftpd.conf

```bash
# DEFAULT SETTINGS
allow_writeable_chroot=YES
anonymous_enable=YES
chroot_local_user=YES
connect_from_port_20=YES
dirmessage_enable=YES
ftpd_banner=Welcome to VSFTPD service.
listen=YES
local_enable=YES
no_anon_password=YES
pasv_addr_resolve=YES
pasv_address=my-ftp-server # <== PLEASE CHANGE THIS
pasv_enable=YES
pasv_max_port=30010
pasv_min_port=30000
port_enable=YES
seccomp_sandbox=NO
write_enable=YES
xferlog_enable=YES

# VIRTUAL USER SETTINGS
#guest_enable=YES
#guest_username=virtual
#local_root=/home/virtual/$USER
#pam_service_name=vsftpd
#user_sub_token=$USER
#virtual_use_local_privs=YES

# SSL SETTINGS
#force_local_data_ssl=YES
#force_local_logins_ssl=YES
#rsa_cert_file=/etc/vsftpd/vsftpd.pem
#rsa_private_key_file=/etc/vsftpd/vsftpd.pem
#ssl_enable=YES
```

> Please set `pasv_address` to your ftp server.

## pam.d/vsftpd

```
auth required pam_pwdfile.so pwdfile=/etc/vsftpd/passwd
account required pam_permit.so
```

## docker-compose.yml

```yaml
vsftpd:
  image: vimagick/vsftpd
  net: host
# ports:
#   - "20:20"
#   - "21:21"
#   - "30000-30010:30000-30010"
  volumes:
    - ./vsftpd:/etc/vsftpd
    - ./ftp:/var/lib/ftp
#   - ./pam.d/vsftpd:/etc/pam.d/vsftpd
#   - ./virtual:/home/virtual
  privileged: true
  restart: always
```

> You can use `ports` instead of `net: host`.
> Make sure these ports are allowed by firewall.

## Server

```bash
$ cd ~/fig/vsftpd/
$ openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout vsftpd/vsftpd.pem -out vsftpd/vsftpd.pem
$ echo "tom:$(openssl passwd -1 uzia9Tu6)" >> vsftpd/passwd
$ echo "ftp's home" > ./ftp/README
$ docker-compose up -d
$ docker exec -it vsftpd_vsftpd_1 sh
>>>
>>> adduser kev
Changing password for kev
New password: ******
Retype password: ******
Password for kev changed by root
>>> echo "kev's home" > ~kev/README
>>>
>>> mkdir ~virtual/tom
>>> echo "tom's home" > ~virtual/tom/README
>>> chown -R virutal:virtual ~virtual
>>>
>>> exit
```

> I added a local user called `kev`, a virtual user called `tom` here.  
> You can edit [/etc/vsftpd/vsftpd.conf][2] to enable more [functions][3].

## Client

You can login as `kev`(local user), `tom`(virtual user) or `ftp`(anonymous user).

```bash
$ ftp my-ftp-server
Connected to my-ftp-server.
220 Welcome to VSFTPD service.
Name (my-ftp-server:kev): ftp
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

Only local user or virtual user can upload file.

```bash
$ lftp
lftp :~> set ssl:verify-certificate no
lftp :~> open tom@my-ftp-server
Password: ******
lftp root@my-ftp-server:~> put README.md
lftp root@my-ftp-server:~> ls
-rw-------    1 0        0             337 Jan 31 16:26 README.md
lftp root@my-ftp-server:~> bye
```

[1]: https://security.appspot.com/vsftpd.html
[2]: http://vsftpd.beasts.org/vsftpd_conf.html
[3]: https://wiki.archlinux.org/index.php/Very_Secure_FTP_Daemon
[4]: https://github.com/tiwe-de/libpam-pwdfile
[5]: http://linux.die.net/man/8/pam_listfile
