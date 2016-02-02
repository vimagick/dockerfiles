mongo
=====

[MongoDB][1] is an open-source, document database designed for ease of development and scaling.

## docker-compose.yml

```yaml
mongo:
  image: mongo
  command: --auth
  container_name: mongo
  ports:
    - "27017:27017"
  restart: always
```

## up and running

```bash
$ pwgen -1 8 2
pah4Xa0o
Aedahwa7

$ cd ~/fig/mongo/

$ docker-compose up -d

$ docker exec -it mongo bash
/# mongo
> use admin
> db.createUser({user: 'root', pwd: 'pah4Xa0o', roles: [{role: 'userAdminAnyDatabase', db: 'admin'}]})
> db.auth('root', 'pah4Xa0o')
> db.runCommand({usersInfo: 1})
> exit
/# exit

$ docker cp mongo:/usr/bin/mongo /usr/local/bin/

$ mongo mongodb://root:pah4Xa0o@localhost:27017/admin
> use mydb
> db.createUser({user: 'myuser', pwd: 'Aedahwa7', roles: [{role: 'readWrite', db: 'mydb'}]})
> exit

$ mongo mongodb://myuser:Aedahwa7@localhost:27017/mydb
> show collections
> exit
```

Read [this][2] and [this][3] for more help.

[1]: https://www.mongodb.org/
[2]: https://docs.mongodb.org/manual/tutorial/enable-authentication/
[3]: https://docs.mongodb.org/manual/reference/built-in-roles/
