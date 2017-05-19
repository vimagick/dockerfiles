wekan
=====

![](https://wekan.github.io/wekan-logo.png)

[Wekan][1] is an open-source kanban board which allows a card-based task and
to-do management, similar to tools like WorkFlowy or Trello.

## docker-compose.yml

```yaml
wekan:
  image: wekanteam/wekan
  ports:
    - "8081:80"
  links:
    - mongo
  environment:
    - MONGO_URL=mongodb://mongo/wekan
    - ROOT_URL=https://todo.easypi.pro
  restart: always

mongo:
   image: mongo
   ports:
    - "27017:27017"
   volumes:
     - ./data:/data/db
  restart: always
```

## Up and Running

```bash
$ docker-compose up -d
$ curl http://localhost:8081
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
