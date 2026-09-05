cowrie
======

![](https://badge.imagelayers.io/vimagick/cowrie:latest.svg)

[Cowrie][1] is a medium interaction SSH honeypot designed to log brute force attacks
and, most importantly, the entire shell interaction performed by the attacker.

Cowrie is directly based on [Kippo][2] by Upi Tamminen (desaster).

## docker-compose.yml

```yaml
services:
  cowrie:
    image: cowrie/cowrie:3.0
    ports:
      - "2222:2222"
      - "2223:2223"
    volumes:
      - cowrie-etc:/cowrie/cowrie-git/etc
      - cowrie-var:/cowrie/cowrie-git/var
    cap_drop:
      - ALL
    read_only: true
    security_opt:
      - no-new-privileges:true
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
$ wget -P ~/.local/bin/ https://github.com/cowrie/cowrie/raw/refs/heads/main/src/cowrie/scripts/asciinema.py
$ wget -P ~/.local/bin/ https://github.com/cowrie/cowrie/raw/refs/heads/main/src/cowrie/scripts/playlog.py
$ chmod +x ~/.local/bin/{asciinema,playlog}.py
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
