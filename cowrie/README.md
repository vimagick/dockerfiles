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
      - ./data/etc:/cowrie/cowrie-git/etc
      - ./data/var:/cowrie/cowrie-git/var
    cap_drop:
      - ALL
    read_only: true
    security_opt:
      - no-new-privileges:true
    restart: unless-stopped
```

## server

```bash
$ mkdir -p data/{etc,var/{lib/cowrie/{downloads,snapshots,tty},log/cowrie,run}}
$ wget -O data/etc/cowrie.cfg https://github.com/cowrie/cowrie/raw/refs/heads/main/src/cowrie/data/etc/cowrie.cfg.dist
$ wget -O data/etc/userdb.txt https://github.com/cowrie/cowrie/raw/refs/heads/main/src/cowrie/data/etc/userdb.example
$ sudo chown -R 999:999 data

$ tree -F
├── data/
│   ├── etc/
│   │   ├── cowrie.cfg
│   │   └── userdb.txt
│   └── var/
│       ├── lib/
│       │   └── cowrie/
│       │       ├── downloads/
│       │       ├── snapshots/
│       │       └── tty/
│       ├── log/
│       │   └── cowrie/
│       └── run/
└── docker-compose.yml

$ docker compose up -d
$ tail -f data/var/log/cowrie/cowrie.json
```

Install some tools to inspect TTY session

```bash
$ mkdir -p ~/.local/bin
$ wget -P ~/.local/bin https://github.com/cowrie/cowrie/raw/refs/heads/main/src/cowrie/scripts/asciinema.py
$ wget -P ~/.local/bin https://github.com/cowrie/cowrie/raw/refs/heads/main/src/cowrie/scripts/playlog.py
$ chmod +x ~/.local/bin/{asciinema,playlog}.py
$ export PATH=~/.local/bin:$PATH
$ playlog.py -c data/var/lib/cowrie/tty/xxxxxx
```

Install [agg][3] to generate GIF from TTY session

```bash
$ asciinema.py -co session.json data/var/lib/cowrie/tty/xxxxxx
$ agg --theme=solarized-light session.json session.gif
```

## client

```bash
$ ssh -p 2222 root@server
$ telnet server 2223
```

> You can login as `root` with any password except `root` or `123456`. (See: userdb.txt)

[1]: https://github.com/micheloosterhof/cowrie
[2]: http://github.com/desaster/kippo/
[3]: https://github.com/asciinema/agg/releases/latest
