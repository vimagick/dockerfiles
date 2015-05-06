MantisBT is an open source issue tracker that provides a delicate balance between simplicity and power.


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
  image: mariadb
  environment:
    - MYSQL_USERNAME=root
    - MYSQL_PASSWORD=root
    - MYSQL_DATABASE=bugtracker
  restart: always
```
