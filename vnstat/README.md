vnstat
======

[vnStat][1] is a console-based network traffic monitor for Linux and BSD that keeps a log of network traffic for the selected interface(s).

### up and running

```bash
$ mkdir -p 777 data
$ docker compose up -d
$ docker compose exec vnstat sh
>>> vnstat --help
>>> vnstati --help
>>> exit
$ sqlite3 data/vnstat.db
>>> .table
>>> .exit
$ curl http://127.0.0.1:8685
```

[1]: http://humdi.net/vnstat/
