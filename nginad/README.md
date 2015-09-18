nginad
======

## docker-compose.yml

```
nginad:
  image: vimagick/nginad
  ports:
    - "8080:80"
  links:
    - mysql
  restart: always

mysql:
  image: mysql
  environment:
    - MYSQL_ROOT_PASSWORD=root
    - MYSQL_DATABASE=nginad
  restart: always
```

## run

```
$ fig up -d
$ wget https://nginad.atlassian.net/wiki/download/attachments/1114149/nginad-1.6.sql
$ docker exec -i nginad_mysql_1 mysql -u root -proot nginad < nginad-1.6.sql
$ fig restart
```
