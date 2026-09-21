vsftpd
======

[vsftpd][1] is a GPL licensed FTP server for UNIX systems, including Linux.
It is secure and extremely fast. It is stable. Don't take my word for it, though.

## Directory Tree

```
~/fig/vsftpd/
├── docker-compose.yml
└── data/
    ├── var/
    │   ├── home            => For Local/Virtual Users
    │   └── ftp             => For Anonymous Users
    └── etc/
        ├── pam.d/
        │   └── vsftpd      => For Virutal Users
        ├── passwd          => For Virtual Users
        ├── vsftpd.conf
        └── vsftpd.pem      => For SSL
```

<details>
<summary>./data/etc/vsftpd.conf</summary>

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
pasv_address=ftp.easypi.duckdns.org    # <== PLEASE CHANGE THIS
pasv_enable=YES
pasv_max_port=30010
pasv_min_port=30000
port_enable=YES
seccomp_sandbox=NO
write_enable=YES
xferlog_enable=YES

# VIRTUAL USER SETTINGS
guest_enable=YES
guest_username=virtual
local_root=/home/virtual/$USER
pam_service_name=vsftpd
user_sub_token=$USER
virtual_use_local_privs=YES

# SSL SETTINGS
force_local_data_ssl=YES
force_local_logins_ssl=YES
rsa_cert_file=/etc/vsftpd/vsftpd.pem
rsa_private_key_file=/etc/vsftpd/vsftpd.pem
ssl_enable=YES
```

> [!Note]
> Please set `pasv_address` to the domain name of your ftp server.

</details>

<details>
<summary>./data/etc/pam.d/vsftpd</summary>

```
auth required pam_pwdfile.so pwdfile=/etc/vsftpd/passwd
account required pam_permit.so
```
</details>

## docker-compose.yml

> [!Tip]
> You can use `ports` instead of `network_mode: host`.
> Make sure these ports are allowed by firewall.

## Server

```bash
$ cd ~/fig/vsftpd/
$ mkdir -p data/{etc,var/{ftp,home}}
$ openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout data/etc/vsftpd.pem -out data/etc/vsftpd.pem
$ echo "tom:$(openssl passwd -1 secret)" >> data/etc/passwd
$ echo "ftp's home" > ./data/var/ftp/README

$ docker compose run --rm vsftpd sh
>>> chown -R root:root /var/lib/ftp /etc/vsftpd /home
>>> chmod 600 /etc/vsftpd/passwd
>>> exit

$ docker compose up -d
$ docker compose exec vsftpd sh

>>> # local user is only for auth, it will also chroot to ~virtual/$USER
>>> adduser -h ~virtual/kev kev
Changing password for kev
New password: ******
Retype password: ******
>>> echo "kev's home" > ~kev/README

>>> id virtual
uid=1000(virtual) gid=1000(virtual) groups=1000(virtual)
>>> mkdir -p ~virtual/tom
>>> echo "tom's home" > ~virtual/tom/README

>>> # do it for local&virtual users
>>> chown -R virtual:virtual ~virtual
>>> tree /home
└── virtual
    ├── kev
    │   └── README
    └── tom
        └── README
>>> exit
```

> [!Note]
> I added a local user called `kev`, a virtual user called `tom` here.  
> You can edit [/etc/vsftpd/vsftpd.conf][2] to enable more [functions][3].


## Client

You can login as `kev`(local user), `tom`(virtual user) or `ftp`(anonymous user).

```bash
$ ftp my-ftp-server
Connected to my-ftp-server.
220 Welcome to VSFTPD service.
Name (my-ftp-server:(none)): ftp    # <= ftp is anonymous user
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

> [!Caution]
> Local user `kev` can login, but cannot do anything else:  
> Fatal error: gnutls_record_recv: An unexpected TLS packet was received.
>> `sudo strace -f -s 200 -e trace=read,write -p $(pidof vsftpd)`  
>> It shows that local user is acting like virtual, it cannot chroot to `/home/virtual/kev` :cry:  
>> You need to move `/home/kev` to `/home/virtual/kev` (`chown virtual:virtual`)  
>> To make life easier, just use virtual users only!

```bash
$ lftp 
lftp> set ftp:ssl-allow off
lftp> open my-ftp-server
lftp> user ftp
Password:  <= no password here, just press enter
lftp> ls
lftp> bye
```

> [!Note]
> Anonymous sessions may not use encryption (allow_anon_ssl=NO)

Only local user or virtual user can upload/delete file.

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
