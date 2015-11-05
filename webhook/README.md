webhook
=======

[webhook][1] is a lightweight configurable tool written in Go, that allows you
to easily create HTTP endpoints (hooks) on your server, which you can use to
execute configured commands.

## Directory Tree

```
~/fig/webhook/
├── docker-compose.yml
└── scripts/
    ├── hooks.json
    └── test.sh*
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
$ docker-compose up -d
$ docker-compose logs
$ curl localhost:9000/hooks/test
```

[1]: https://github.com/adnanh/webhook
