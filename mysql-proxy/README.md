mysql-proxy
===========

[MySQL Proxy][1] is an application that communicates over the network using the
MySQL client/server protocol and provides communication between one or more
MySQL servers and one or more MySQL clients.

```
# run docker container
$ docker-compose up -d

# view log in shell
$ journalctl -f CONTAINER_NAME=mysql-proxy

# view log in python
$ apt install python3-systemd
$ python3 code.py
```

[1]: https://github.com/mysql/mysql-proxy
