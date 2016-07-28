FreeRadius
==========

[FreeRADIUS][1] includes a RADIUS server, a BSD licensed client library, a PAM
library, and an Apache module. In most cases, the word FreeRADIUS refers to the
RADIUS server.

## docker-compose.yml

```yaml
freeradius:
  image: vimagick/freeradius
  ports:
    - "1812:1812/udp"
    - "1813:1813/udp"
  links:
    - mysql
  restart: always

mysql:
  image: mysql
  volumes:
    - ./mysql:/docker-entrypoint-initdb.d
  environment:
    - MYSQL_ROOT_PASSWORD=root
  restart: always
```

## Server Setup

```bash
$ docker-compose up -d mysql
$ docker-compose exec mysql mysql -uroot -proot radius
>>> show tables;
+------------------+
| Tables_in_radius |
+------------------+
| nas              |
| radacct          |
| radcheck         |
| radgroupcheck    |
| radgroupreply    |
| radpostauth      |
| radreply         |
| radusergroup     |
+------------------+
8 rows in set (0.00 sec)

>>> SHOW GRANTS FOR radius;
+----------------------------------------------------------------+
| Grants for radius@%                                            |
+----------------------------------------------------------------+
| GRANT USAGE ON *.* TO 'radius'@'%'                             |
| GRANT SELECT ON `radius`.* TO 'radius'@'%'                     |
| GRANT ALL PRIVILEGES ON `radius`.`radacct` TO 'radius'@'%'     |
| GRANT ALL PRIVILEGES ON `radius`.`radpostauth` TO 'radius'@'%' |
+----------------------------------------------------------------+
5 rows in set (0.00 sec)

>>> INSERT INTO radcheck VALUES(NULL, 'user', 'Cleartext-Password', ':=', 'pass');
Query OK, 1 row affected (0.00 sec)

>>> SELECT * FROM radcheck;
+----+----------+--------------------+----+-------+
| id | username | attribute          | op | value |
+----+----------+--------------------+----+-------+
|  1 | user     | Cleartext-Password | := | pass  |
+----+----------+--------------------+----+-------+
1 row in set (0.00 sec)

>>> INSERT INTO nas VALUES(NULL, '0.0.0.0/0', 'testing', NULL, NULL, 'testing321', NULL, NULL, NULL);
Query OK, 1 row affected (0.02 sec)

>>> SELECT * FROM nas;
+----+-----------+-----------+------+-------+------------+--------+-----------+-------------+
| id | nasname   | shortname | type | ports | secret     | server | community | description |
+----+-----------+-----------+------+-------+------------+--------+-----------+-------------+
|  1 | 0.0.0.0/0 | testing   | NULL |  NULL | testing321 | NULL   | NULL      | NULL        |
+----+-----------+-----------+------+-------+------------+--------+-----------+-------------+
1 row in set (0.00 sec)

>>> SELECT * FROM radpostauth;
+----+----------+--------------------------------------------------------------+---------------+---------------------+
| id | username | pass                                                         | reply         | authdate            |
+----+----------+--------------------------------------------------------------+---------------+---------------------+
|  1 | user     | pass                                                         | Access-Accept | 2016-07-28 06:28:28 |
|  2 | user     | pass                                                         | Access-Accept | 2016-07-28 06:30:04 |
|  3 | user     | xxxx                                                         | Access-Reject | 2016-07-28 06:30:22 |
+----+----------+--------------------------------------------------------------+---------------+---------------------+

>>> EXIT
Bye

$ docker-compose up -d freeradius
$ docker-compose exec freeradius sh
>>> vi /etc/raddb/clients.conf
>>> radtest user pass localhost 0 testing123
>>> exit
$ docker-compose restart freeradius
```

```
# /etc/raddb/clients.conf

#client testing {
#        ipaddr = 0.0.0.0/0
#        secret = testing321
#}
```

> Manage NAS (Network Access Server) via MySQL.

## Client Setup

```bash
# ssh root@192.168.31.231
$ pacman -S freeradius freeradius-client
$ radtest user pass 192.168.31.234 0 testing321
$ radtest user xxxx 192.168.31.234 0 testing321
```

[1]: http://freeradius.org/
