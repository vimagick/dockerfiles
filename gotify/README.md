gotify
======

[Gotify][1] is a simple server for sending and receiving messages.

![](https://gotify.net/img/intro.png)

```bash
# server
$ docker-compose up -d
$ curl http://localhost:8080

# client
$ wget -O gotify https://github.com/gotify/cli/releases/download/v2.2.0/gotify-cli-linux-amd64
$ chmod +x gotify
$ gotify init
$ gotify push -t "my title" -p 10 "my message"
```

[1]: https://gotify.net/
