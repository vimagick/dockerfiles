Rocket.Chat
===========

![](https://rocket.chat/images/default/logo--dark.svg)

[Rocket.Chat][1] is a Web Chat Server, developed in JavaScript, using the Meteor fullstack framework.

## up and running

```bash
$ docker-compose up -d mongo
$ docker-compose exec mongo mongo
>>> rs.initiate({_id: 'rs0', members: [{_id: 0, host: 'localhost:27017'}]})
>>> exit
$ docker-compose up -d rocketchat
$ curl http://127.0.0.1:3000
```

[1]: https://rocket.chat/
