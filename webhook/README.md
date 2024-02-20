webhook
=======

![](https://badge.imagelayers.io/vimagick/webhook:latest.svg)

[webhook][1] is a lightweight configurable tool written in Go, that allows you
to easily create HTTP endpoints (hooks) on your server, which you can use to
execute configured commands.

## Directory Tree

```bash
~/fig/webhook/
├── docker-compose.yml
└── data/
    ├── hooks.json
    └── test.sh* (executable)
```

File: data/hooks.yaml

```yaml
- id: test
  execute-command: /etc/webhook/test.sh
  pass-file-to-command:
  - source: entire-payload
    envname: HOOK_PAYLOAD
  command-working-directory: /etc/webhook
  include-command-output-in-response: true
```

File: data/test.sh

```bash
#!/bin/bash
echo 'hello world'
cat $HOOK_PAYLOAD
```

## Up and Running

```bash
$ cd ~/fig/webhook/

$ chmod +x data/test.sh

$ docker-compose up -d
Creating webhook_webhook_1...

$ curl http://localhost:9000/hooks/test -d hello=world
hello world
{"hello":"world"}

$ docker-compose logs
Attaching to webhook_webhook_1
webhook_1 | [webhook] 2024/02/20 04:26:52 version 2.8.1 starting
webhook_1 | [webhook] 2024/02/20 04:26:52 setting up os signal watcher
webhook_1 | [webhook] 2024/02/20 04:26:52 attempting to load hooks from hooks.json
webhook_1 | [webhook] 2024/02/20 04:26:52 loaded 1 hook(s) from file
webhook_1 | [webhook] 2024/02/20 04:26:52       > test
webhook_1 | [webhook] 2024/02/20 04:26:52 starting insecure (http) webhook on :9000
webhook_1 | [webhook] 2024/02/20 04:26:52 os signal watcher ready
webhook_1 | [webhook] 2024/02/20 04:27:11 Started GET /hooks/test
webhook_1 | [webhook] 2024/02/20 04:27:11 Completed 200 OK in 390.207µs
webhook_1 | [webhook] 2024/02/20 04:27:11 test got matched (1 time(s))
webhook_1 | [webhook] 2024/02/20 04:27:11 test hook triggered successfully
webhook_1 | [webhook] 2024/02/20 04:27:11 executing /scripts/test.sh (/scripts/test.sh) with arguments ["/etc/webhook/test.sh"] and environment [HOOK_PAYLOAD=/etc/webhook/HOOK_PAYLOAD967569167] using /etc/webhook as cwd
webhook_1 | [webhook] 2024/02/20 04:27:11 command output: hello world
webhook_1 | {"hello":"world"}
webhook_1 | [webhook] 2024/02/20 04:27:11 finished handling test
```

[1]: https://github.com/adnanh/webhook
