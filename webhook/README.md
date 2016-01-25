webhook
=======

![](https://badge.imagelayers.io/vimagick/webhook:latest.svg)

[webhook][1] is a lightweight configurable tool written in Go, that allows you
to easily create HTTP endpoints (hooks) on your server, which you can use to
execute configured commands.

## Build Binary

To build a docker image from scratch, we need to build static linked binary.

```bash
$ go get -d github.com/adnanh/webhook
$ CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -installsuffix cgo -ldflags '-s -extld ld -extldflags -static' -a -x -o webhook github.com/adnanh/webhook
$ file webhook
```

## Directory Tree

```
~/fig/webhook/
├── docker-compose.yml
└── scripts/
    ├── hooks.json
    └── test.sh* (executable)
```

docker-compose.yml

```
webhook:
  image: vimagick/webhook
  command: -hooks hooks.json -verbose
  ports:
    - "9000:9000"
  volumes:
    - "./scripts:/scripts"
  restart: always
```

hooks.json

```
[
  {
    "id": "test",
    "execute-command": "/scripts/test.sh",
    "command-working-directory": "/scripts"
  }
]
```

test.sh

```
#!/bin/bash
echo 'hello world'
```

## Up and Running

```
$ cd ~/fig/webhook/

$ chmod +x scripts/test.sh

$ docker-compose up -d
Creating webhook_webhook_1...

$ curl http://localhost:9000/hooks/test

$ docker-compose logs
Attaching to webhook_webhook_1
webhook_1 | [webhook] 2015/11/05 04:26:52 version 2.3.5 starting
webhook_1 | [webhook] 2015/11/05 04:26:52 setting up os signal watcher
webhook_1 | [webhook] 2015/11/05 04:26:52 attempting to load hooks from hooks.json
webhook_1 | [webhook] 2015/11/05 04:26:52 loaded 1 hook(s) from file
webhook_1 | [webhook] 2015/11/05 04:26:52       > test
webhook_1 | [webhook] 2015/11/05 04:26:52 starting insecure (http) webhook on :9000
webhook_1 | [webhook] 2015/11/05 04:26:52 os signal watcher ready
webhook_1 | [webhook] 2015/11/05 04:27:11 Started GET /hooks/test
webhook_1 | [webhook] 2015/11/05 04:27:11 Completed 200 OK in 390.207µs
webhook_1 | [webhook] 2015/11/05 04:27:11 test got matched (1 time(s))
webhook_1 | [webhook] 2015/11/05 04:27:11 test hook triggered successfully
webhook_1 | [webhook] 2015/11/05 04:27:11 executing /scripts/test.sh (/scripts/test.sh) with arguments [/scripts/test.sh] using /scripts as cwd
webhook_1 | [webhook] 2015/11/05 04:27:11 command output: hello world
webhook_1 |
webhook_1 | [webhook] 2015/11/05 04:27:11 finished handling test
```

[1]: https://github.com/adnanh/webhook
