phpBB
=====

[phpBB][1] is a free flat-forum bulletin board software solution
that can be used to stay in touch with a group of people
or can power your entire website.

This docker image support mysqli/postgres/sqlite3.
If you choose sqlite3, please use `/var/www/store/phpbb.db` as dbpath.
And it has no volumes, please use phpBB control panel to backup database.

## docker-compose.yml

```yaml
version: "3.8"
services:
  phpbb:
    image: vimagick/phpbb
    ports:
      - "8000:80"
    volumes:
      - ./data:/var/www/store
    restart: unless-stopped
```

# up and running

```bash
# create volume
$ mkdir -m 777 data

# run container
$ docker-compose up -d

# setup forum
$ firefox http://localhost:8000/install

# view database
$ sqlite3 data/phpbb.db
>>> .help
>>> .quit
```

[1]: https://www.phpbb.com/
