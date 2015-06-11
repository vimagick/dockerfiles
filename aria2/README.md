`aria2` is a utility for downloading files.

## directory tree

```
~/fig/aria2/
├── docker-compose.yml
├── data/
└── keys/
    ├── server.crt
    └── server.key
```

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
```

## server

```
$ mkdir -p ~/fig/aria2/{data,keys}/
$ cd ~/fig/aria2/
$ vim docker-compose.yml
$ openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout keys/server.key -out keys/server.crt
$ fig up -d
```

## client

```
$ scp server:fig/aria2/keys/server.crt /usr/local/share/ca-certificates/
$ update-ca-certificates --fresh

$ uuidgen
3c5323b8-79f7-49d4-8303-fcfe51488db5

$ http --verify no https://datageek.info:6800/jsonrpc \
       id=3c5323b8-79f7-49d4-8303-fcfe51488db5 \
       method=aria2.getGlobalStat \
       params:='["token:e6c3778f-6361-4ed0-b126-f2cf8fca06db"]'

$ curl https://datageek.info:6800/jsonrpc --data '
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
```

> Please choose `CommonName` properly when generating keys.  
> `httpie` will throw error without `--verify no` option, I don't know why!
