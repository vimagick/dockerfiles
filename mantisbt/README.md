MantisBT is an open source issue tracker that provides a delicate balance between simplicity and power.

WARNING: This is still a work in progress, a successful connection has not been made.


## docker-compose.yml

```
mantisbt:
  image: vimagick/mantisbt
  ports:
    - "80:80"
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
$ firefox http://localhost/admin/install.php
>>> username: administrator
>>> password: root
```
