`MantisBT` is an open source issue tracker that provides
a delicate balance between simplicity and power.

## docker-compose.yml

```
mantisbt:
  image: vimagick/mantisbt:latest
  ports:
    - "8989:80"
  links:
    - mysql
  restart: always

mysql:
  image: mysql:latest
  environment:
    - MYSQL_ROOT_PASSWORD=root
    - MYSQL_DATABASE=bugtracker
    - MYSQL_USER=mantisbt
    - MYSQL_PASSWORD=mantisbt
  restart: always
```

> You can use `mariadb`/`postgres` instead of `mysql`.

## setup

```
$ firefox http://localhost:8989/admin/install.php
>>> username: administrator
>>> password: root
```

```
==================================================================================
Installation Options
==================================================================================
Type of Database                                        MySQL/MySQLi
Hostname (for Database Server)                          mysql
Username (for Database)                                 mantisbt
Password (for Database)                                 mantisbt
Database name (for Database)                            bugtracker
Admin Username (to create Database if required)         root
Admin Password (to create Database if required)         root
Print SQL Queries instead of Writing to the Database    [ ]
Attempt Installation                                    [Install/Upgrade Database]
==================================================================================
```

## todo

- support `curl`
- config `smtp`
- ...
