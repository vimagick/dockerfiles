mailhog
=======

[MailHog][1] is an email testing tool for developers:

- Configure your application to use MailHog for SMTP delivery
- View messages in the web UI, or retrieve them with the JSON API
- Optionally release messages to real SMTP servers for delivery

```bash
$ mkdir data
$ chown 1000:1000 data
$ docker-compose up -d
$ curl http://localhost:8025

$ ncat -C localhost 1025
HELO
MAIL FROM: <kevin@gmail.com>
RCPT TO: <sarah@yahoo.com>
DATA
Subject: test

This is a test message.
.
QUIT
^D (press Ctrl-D to exit)
```

[1]: https://github.com/mailhog/MailHog/blob/master/docs/CONFIG.md
