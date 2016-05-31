gogs
====

[Gogs][1] (Go Git Service) is a painless self-hosted Git service.

## docker-compose.yml

```yaml
gogs:
  image: gogs/gogs
  ports:
    - "2222:22"
    - "3000:3000"
  volumes:
    - ./data:/data
  restart: always
```

## up and running

```
$ docker-compose up -d

$ docker-compose exec gogs vi /data/gogs/conf/app.ini

$ docker-compose restart

$ firefox http://localhost:3000/

$ tree -FL 3 ./data/git/
./data/git/
├── git -> /data/git
└── gogs-repositories/
    ├── root/
    ├── user1/
    │   ├── project1.git/
    │   └── project2.git/
    └── user2/
```

[1]: https://gogs.io/
