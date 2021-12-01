mongo
=====

[MongoDB][1] is an open-source, document database designed for ease of development and scaling.

## up and running

```bash
$ pwgen -1 8 1
Aedahwa7

$ docker-compose up -d

$ docker-compose cp mongo:/usr/bin/mongo /usr/local/bin/

$ mongo mongodb://root:root@localhost:27017/admin
>>> use mydb
>>> db.createUser({user: 'myuser', pwd: 'Aedahwa7', roles: [{role: 'readWrite', db: 'mydb'}]})
>>> exit

$ mongo mongodb://myuser:Aedahwa7@localhost:27017/mydb
>>> show collections
>>> exit
```

Read [this][2] and [this][3] for more help.

[1]: https://www.mongodb.org/
[2]: https://docs.mongodb.org/manual/tutorial/enable-authentication/
[3]: https://docs.mongodb.org/manual/reference/built-in-roles/
