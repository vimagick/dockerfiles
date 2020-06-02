yourls
======

[YOURLS][1] stands for Your Own URL Shortener. It is a small set of PHP scripts
that will allow you to run your own URL shortening service (a la TinyURL or
Bitly).

## docker-compose.yml

```yaml
version: '3.8'

services:

  yourls:
    image: yourls:1.7
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
    restart: unless-stopped

  mysql:
    image: mysql:5.7
    volumes:
      - ./data:/var/lib/mysql
    environment:
      - MYSQL_ROOT_PASSWORD=root
      - MYSQL_DATABASE=yourls
    restart: unless-stopped
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

## Backup and Restore

```bash
# backup
$ docker-compose exec -T mysql mysqldump -uroot -proot yourls > yourls-$(date +%F).sql

# restore
$ docker exec -i yourls_mysql_1 mysql -uroot -proot yourls < yourls-$(date +%F -d yesterday).sql
```

## Upgrade Image

- backup config.php
- backup plugins
- remove container (with volume)
- create container
- restore plugins
- restore config.php
- restart container

[1]: http://yourls.org/
