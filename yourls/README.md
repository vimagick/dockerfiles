yourls
======

[YOURLS][1] stands for Your Own URL Shortener. It is a small set of PHP scripts
that will allow you to run your own URL shortening service (a la TinyURL or Bitly).

## Up and Running

```bash
$ mkdir -m 777 -p data/{yourls,mysql,nginx}
$ vim data/nginx/default.conf
$ docker compose up -d
$ docker compose cp yourls:/var/www/html/user/config.php config.php
$ vim config.php
$ docker compose cp config.php yourls:/var/www/html/user/
$ docker compose exec chown www-data:www-data /var/www/html/user/config.php
$ docker compose exec chmod 664 /var/www/html/user/config.php
```

<details>
<summary>config.php</summary>

```php
/** Username(s) and password(s) allowed to access the site. Passwords either in plain text or as encrypted hashes
 ** YOURLS will auto encrypt plain text passwords in this file
 ** Read http://yourls.org/userpassword for more information */
$yourls_user_passwords = [
    'user1' => 'secret1',
    'user2' => 'secret2',
];
```
</details>

## Backup and Restore

```bash
# backup
$ docker compose exec -T mysql mysqldump -uroot -proot yourls > yourls-$(date +%F).sql

# restore
$ docker compose exec -T mysql mysql -uroot -proot yourls < yourls-$(date +%F -d yesterday).sql
```

## Upgrade Image

- backup config.php
- backup plugins
- remove container (with volume)
- create container
- restore plugins
- restore config.php
- restart container

> [!Caution]
> Planned Downtime

[1]: http://yourls.org/
