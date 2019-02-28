yourls
======

[YOURLS][1] stands for Your Own URL Shortener. It is a small set of PHP scripts
that will allow you to run your own URL shortening service (a la TinyURL or
Bitly).

## docker-compose.yml

```yaml
version: '3.1'

services:

  yourls:
    image: yourls
    ports:
      - "8080:80"
    environment:
      - YOURLS_DB_HOST=mysql
      - YOURLS_DB_USER=root
      - YOURLS_DB_PASS=root
      - YOURLS_DB_NAME=yourls
      - YOURLS_USER=admin
      - YOURLS_PASS=admin
      - YOURLS_SITE=https://yourls.easypi.pro
    depends_on:
      - mysql
    restart: always

  mysql:
    image: mysql:5.7
    volumes:
      - ./data:/var/lib/mysql
    environment:
      - MYSQL_ROOT_PASSWORD=root
      - MYSQL_DATABASE=yourls
    restart: always
```

## Up and Running

```bash
$ docker-compose up -d
$ docker cp yourls_yourls_1:/var/www/html/user/config.php .
$ vi config.php
$ docker cp config.php yourls_yourls_1:/var/www/html/user/
$ docker-compose exec chown www-data:www-data /var/www/html/user/config.php
$ docker-compose exec chmod 664 /var/www/html/user/config.php
```

File: config.php

```php
/** Username(s) and password(s) allowed to access the site. Passwords either in plain text or as encrypted hashes
 ** YOURLS will auto encrypt plain text passwords in this file
 ** Read http://yourls.org/userpassword for more information */
$yourls_user_passwords = [
    'user1' => 'secret1',
    'user2' => 'secret2',
];
```

## Backup Database

```bash
$ docker-compose exec -T mysql mysqldump -uroot -proot yourls > yourls-$(date +\%F).sql
```

[1]: http://yourls.org/
