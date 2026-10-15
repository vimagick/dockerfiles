dropbear
========

> [!Caution]
> An SSH server with empty password.  
> Anyone can login without password!

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
