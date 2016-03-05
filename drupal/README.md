drupal
======

```
drupal:
  image: drupal
  ports:
    - "8888:80"
  links:
    - mysql
  restart: always

mysql:
  image: mysql
  ports:
    - "127.0.0.1:3306:3306"
  environment:
    - MYSQL_ROOT_PASSWORD=root
    - MYSQL_DATABASE=drupal
  restart: always
```

```
cd ~/fig/drupal/
docker-compose up -d mysql
sleep 30
docker-compose up -d drupal

docker cp drupal_mysql_1:/usr/bin/mysql /usr/local/bin/
mysql -h127.0.0.1 -P3306 -uroot -proot drupal

firefox http://127.0.0.1:8888
```
