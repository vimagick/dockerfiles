gogs
====

[Gogs][1] (Go Git Service) is a painless self-hosted Git service.

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

Please read [this][2] to learn more about `app.ini`.

[1]: https://gogs.io/
[2]: https://gogs.io/docs/advanced/configuration_cheat_sheet.html
