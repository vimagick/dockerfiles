cowrie
======

[`Cowrie`][1] is a medium interaction SSH honeypot designed to log brute force attacks
and, most importantly, the entire shell interaction performed by the attacker.

`Cowrie` is directly based on [`Kippo`][2] by Upi Tamminen (desaster).

## docker-compose.yml

```
cowrie:
  image: vimagick/cowrie
  ports:
    - "2222:2222"
  volumes:
    - log:/home/cowrie/log
  restart: always
```

## server

```
$ cd ~/fig/cowrie
$ tree -F
.
├── docker-compose.yml
└── log/
    └── tty/
$ docker-compose up -d
$ tail -f log/cowrie.log
```

## client

```
$ ssh -p 2222 root@server
```

> You can login as `root:root` or `root:123456`.

[1]: https://github.com/micheloosterhof/cowrie
[2]: http://github.com/desaster/kippo/
