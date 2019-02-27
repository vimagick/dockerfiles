yourls
======

[YOURLS][1] stands for Your Own URL Shortener. It is a small set of PHP scripts
that will allow you to run your own URL shortening service (a la TinyURL or
Bitly).

# Up and Running

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

[1]: http://yourls.org/
