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

> You can generate `server.key` and `server.crt` via this command:
>> `openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout server.key -out server.crt`


## docker-compose.yml

```
aria2:
  image: vimagick/aria2
  ports:
    - "6800:6800"
  volumes:
    - "data:/var/lib/aria2"
    - "keys:/etc/aria2"
  environment:
    - TOKEN=e6c3778f-6361-4ed0-b126-f2cf8fca06db
  restart: always
```

## test

```
$ http --verify no https://localhost:6800/jsonrpc \
       id=$(uuidgen) \
       method=aria2.getGlobalStat \
       params:='["token:e6c3778f-6361-4ed0-b126-f2cf8fca06db"]'

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
