aria2
=====

- `aria2` is a utility for downloading files.
- `yaaw` is yet another aria2 web frontend.

## directory tree

```
~/fig/aria2/
├── docker-compose.yml
├── html/
│   ├── README.md
│   ├── TODO.md
│   ├── css/...
│   ├── img/...
│   ├── index.html
│   ├── js/...
│   └── offline.appcache
├── data -> /home/aria2/
└── keys/
    ├── server.crt
    └── server.key
```

> You may make `data` a symbolic link to `/home/aria2` or somewhere else.

## docker-compose.yml

```
aria2:
  image: vimagick/aria2
  ports:
    - "6800:6800"
  volumes:
    - "data:/home/aria2"
    - "keys:/etc/aria2"
  environment:
    - TOKEN=e6c3778f-6361-4ed0-b126-f2cf8fca06db
  restart: always

yaaw:
  image: vimagick/nginx
  ports:
    - "8080:80"
  volumes:
    - html:/usr/share/nginx/html
  restart: always
```

## server

```
$ mkdir -p ~/fig/aria2/{html,keys}/
$ cd ~/fig/aria2/
$ ln -s /home/aria2 data
$ curl -sSL https://github.com/binux/yaaw/archive/master.tar.gz | tar xz --strip 1 -C html
$ openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout keys/server.key -out keys/server.crt
$ vim docker-compose.yml
$ fig up -d
```

## client

```
$ scp server:fig/aria2/keys/server.crt /usr/local/share/ca-certificates/
$ update-ca-certificates --fresh

$ uuidgen
3c5323b8-79f7-49d4-8303-fcfe51488db5

$ http --verify no https://server:6800/jsonrpc \
       id=3c5323b8-79f7-49d4-8303-fcfe51488db5 \
       method=aria2.getGlobalStat \
       params:='["token:e6c3778f-6361-4ed0-b126-f2cf8fca06db"]'

$ curl https://server:6800/jsonrpc --data '
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
#   wss://token:e6c3778f-6361-4ed0-b126-f2cf8fca06db@server:6800/jsonrpc
#
# Firefox » Top-Right Corner:
#   Aria2 1.18.10
#   ↓0 KB/s / ↑0 KB/s
#
```

> Please choose `CommonName` properly when generating keys.  
> `httpie` will throw error without `--verify no` option, I don't know why!  
> Open `https://server:6800` in your browser, and accept security certificate.  

