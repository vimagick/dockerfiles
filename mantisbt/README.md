`MantisBT` is an open source issue tracker that provides
a delicate balance between simplicity and power.

## docker-compose.yml

```
mantisbt:
  image: vimagick/mantisbt
  ports:
    - "8989:80"
  links:
    - db:mysql
  restart: always

db:
  image: mysql
  environment:
    - MYSQL_ROOT_PASSWORD=root
    - MYSQL_DATABASE=bugtracker
  restart: always
```

## setup

```
$ docker exec -it mantisbt_mantisbt_1 bash
>>> echo 'date.timezone = "Asia/Shanghai"' > /usr/local/etc/php/php.ini
>>> exit
$ firefox http://localhost:8989/admin/install.php
>>> username: administrator
>>> password: root
```
