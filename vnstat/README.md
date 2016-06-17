vnstat
======

[vnStat][1] is a console-based network traffic monitor for Linux and BSD that keeps
a log of network traffic for the selected interface(s).

### docker-compose.yml

```yaml
vnstat:
  image: vimagick/vnstat
  volumes:
    - ./data:/var/lib/vnstat
  net: host
  restart: always
```

### up and running

```bash
docker-compose up -d
docker-compose exec vnstat bash
>>> vnstat --help
>>> vnstati --help
>>> exit
```

[1]: http://humdi.net/vnstat/
