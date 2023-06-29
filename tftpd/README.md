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

[1]: https://wiki.archlinux.org/title/TFTP
