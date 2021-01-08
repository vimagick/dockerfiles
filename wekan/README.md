wekan
=====

![](https://wekan.github.io/wekan-logo.png)

[Wekan][1] is an open-source kanban board which allows a card-based task and
to-do management, similar to tools like WorkFlowy or Trello.

## Up and Running

```bash
$ docker-compose up -d
$ curl http://localhost:8080
```

## Admin Panel » Settings

```yaml
Registration:
    Disable Self-Registration: yes
    Invite People: []

Email:
    SMTP Host: smtp.gmail.com
    SMTP Port: 465
    Username: username
    Password: ********
    TLS support: yes
    From: username@gmail.com
```

[1]: https://wekan.github.io/
