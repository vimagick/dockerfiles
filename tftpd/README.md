tftpd
=====

[tftpd][1] is a server for the Trivial File Transfer Protocol.

## up and running

```bash
$ docker-compose up -d
$ echo 'hello world' > /tmp/hello.txt
$ curl -T /tmp/hello.txt tftp://127.0.0.1/
$ curl tftp://127.0.0.1/hello.txt
```

## realtime logging

```
$ docker-compose exec tftpd sh
>>> apk add --no-cache inetutils-syslogd
>>> syslogd
>>> tail -f /var/log/syslog
Jun 29 08:26:30 server syslogd (GNU inetutils 2.4): restart
Jun 29 08:27:28 server in.tftpd[90]: WRQ from 127.0.0.1 filename hello.txt
Jun 29 08:27:34 server in.tftpd[91]: RRQ from 127.0.0.1 filename hello.txt
```

[1]: https://wiki.archlinux.org/title/TFTP
