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

## install

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

## email

Append following to `/var/www/html/config/config_inc.php`

```
$g_phpMailer_method = PHPMAILER_METHOD_SMTP;
$g_administrator_email = 'admin@example.org';
$g_webmaster_email = 'webmaster@example.org';
$g_return_path_email = 'mantisbt@example.org';
$g_from_email = 'mantisbt@example.org';
$g_smtp_host = 'smtp.example.org';
$g_smtp_port = 25;
$g_smtp_connection_mode = 'tls';
$g_smtp_username = 'mantisbt';
$g_smtp_password = '********';
```

