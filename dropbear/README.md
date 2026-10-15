dropbear
========

> [!Caution]
> A SSH server with empty password.  
> Any one can login without password!

## Server

```bash
$ docker compose up -d
$ docker compose exec dropbear sh
>>> netstat -ant
>>> exit
```

## Client

```bash
$ ssh -p 2222 root@localhost
```
