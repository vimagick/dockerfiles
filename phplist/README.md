phplist
=======

[phpList][1] is software for sending email newsletters, marketing campaigns and
announcements: you can send to millions of subscribers or just to a few
hundred. phpList is used via a web browser and installed on your server. For
more information see the [features page][2].

```bash
$ mkdir -p data/{mailhog,phplist/{images,plugins}}
$ vi data/phplist/config.php
$ chmod 777 data/{mailhog,phplist/{images,plugins}}
$ tree -F data/
├── mailhog/
└── phplist/
    ├── config.php
    ├── images/
    └── plugins/
$ docker-compose up -d
$ curl http://127.0.0.1:8000/lists/admin/
```

[1]: https://www.phplist.org/
[2]: https://www.phplist.org/features/
