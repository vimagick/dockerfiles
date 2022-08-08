aria2
=====

![](https://badge.imagelayers.io/vimagick/aria2:latest.svg)

- [aria2][1] is a utility for downloading files.
- [yaaw][2] is yet another aria2 web frontend.
- [AriaNg][3] is a modern web frontend making aria2 easier to use.

## directory tree

```
~/fig/aria2/
├── docker-compose.yml
└── data/
    ├── var/ -> /mnt/usb/
    └── etc/
        ├── default.conf
        └── aria2.conf
```

> You may make `var` a symbolic link to `/mnt/usb` or somewhere else.
> To implement disk quota, you can even create a [virtual disk][5].

## docker-compose.yml

```yaml
version: "3.8"

services:

  aria2:
    image: vimagick/aria2
    ports:
      - "6800:6800"
    volumes:
      - ./data/etc:/etc/aria2/
      - ./data/var:/data
    environment:
      - TOKEN=0d5e0e73-96f7-4936-b125-e8f5f2296b08
    restart: unless-stopped

  webui:
    image: vimagick/ariang
    ports:
      - "8080:80"
    restart: unless-stopped
```

## aria2.conf

```ini
dir=/data
disable-ipv6=true
enable-rpc=true
max-download-limit=0
max-upload-limit=0
rpc-allow-origin-all=true
rpc-listen-all=true
rpc-listen-port=6800
rpc-secret=00000000-0000-0000-0000-000000000000
seed-ratio=0
seed-time=0
```

## server

```bash
$ mkdir -p ~/fig/aria2/data/html
$ cd ~/fig/aria2/data
$ ln -s /mnt/usb disk
$ cd html
$ curl -sSL https://github.com/binux/yaaw/archive/master.tar.gz | tar xz --strip 1
####################################################################################
# wget https://github.com/mayswind/AriaNg/releases/download/1.2.4/AriaNg-1.2.4.zip #
# unzip AriaNg-1.2.4.zip                                                           #
####################################################################################
$ vim docker-compose.yml
$ docker-compose up -d
```

## client

```bash
$ uuidgen
3c5323b8-79f7-49d4-8303-fcfe51488db5

$ http http://server:6800/jsonrpc \
       id=3c5323b8-79f7-49d4-8303-fcfe51488db5 \
       method=aria2.getGlobalStat \
       params:='["token:e6c3778f-6361-4ed0-b126-f2cf8fca06db"]'

$ curl http://server:6800/jsonrpc --data '
       {
         "id": "3c5323b8-79f7-49d4-8303-fcfe51488db5",
         "method": "aria2.getGlobalStat",
         "params": ["token:e6c3778f-6361-4ed0-b126-f2cf8fca06db"]
       }' | jq .

{
  "id": "3c5323b8-79f7-49d4-8303-fcfe51488db5",
  "jsonrpc": "2.0",
  "result": {
    "downloadSpeed": "0",
    "numActive": "0",
    "numStopped": "0",
    "numStoppedTotal": "0",
    "numWaiting": "0",
    "uploadSpeed": "0"
  }
}

$ firefox http://server:8080/
#
# Settings » JSON-RPC Path:
#   ws://token:e6c3778f-6361-4ed0-b126-f2cf8fca06db@server:6800/jsonrpc
#
# Firefox » Top-Right Corner:
#   Aria2 1.18.10
#   ↓0 KB/s / ↑0 KB/s
#
```

[1]: https://github.com/aria2/aria2
[2]: https://github.com/binux/yaaw
[3]: https://github.com/mayswind/AriaNg
[5]: http://souptonuts.sourceforge.net/quota_tutorial.html
