gogs
====

[Gogs][1] (Go Git Service) is a painless self-hosted Git service.

## docker-compose.yml

```yaml
gogs:
  image: gogs/gogs
  ports:
    - "22:22"
    - "80:3000"
  volumes:
    - ./data:/data
  restart: always
```

> :warning: Listening on port 22 and 80 may cause problems!

## up and running

```
$ docker-compose up -d

$ firefox http://localhost/

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
