cowrie
======

![](https://badge.imagelayers.io/vimagick/cowrie:latest.svg)

[Cowrie][1] is a medium interaction SSH honeypot designed to log brute force attacks
and, most importantly, the entire shell interaction performed by the attacker.

Cowrie is directly based on [Kippo][2] by Upi Tamminen (desaster).

## docker-compose.yml

```yaml
version: "3.8"

services:
  cowrie:
    image: cowrie/cowrie
    ports:
      - "2222:2222"
      - "2223:2223"
    volumes:
      - cowrie-etc:/cowrie/cowrie-git/etc
      - cowrie-var:/cowrie/cowrie-git/var
    restart: unless-stopped

volumes:
  cowrie-etc:
  cowrie-var:
```

## server

```bash
$ docker-compose up -d
$ docker volume ls
$ docker volume inspect cowrie_cowrie-var
$ cd /var/lib/docker/volumes/cowrie_cowrie-etc/_data
$ cp cowrie.cfg.dist cowrie.cfg
$ cp userdb.example userdb.txt
$ cd /var/lib/docker/volumes/cowrie_cowrie-var/_data
$ tail -f log/cowrie/cowrie.json
```

```bash
$ wget -P /usr/local/bin/ https://github.com/cowrie/cowrie/raw/master/bin/asciinema
$ wget -P /usr/local/bin/ https://github.com/cowrie/cowrie/raw/master/bin/playlog
$ chmod +x /usr/local/bin/{asciinema,playlog}
$ playlog -c lib/cowrie/tty/xxxxxx
```

## client

```bash
$ ssh -p 2222 root@server
$ telnet server 2223
```

> You can login as `root` with any password except `root` or `123456`.

[1]: https://github.com/micheloosterhof/cowrie
[2]: http://github.com/desaster/kippo/
