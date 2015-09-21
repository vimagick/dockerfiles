nginad
======

[NginAd][1] open source ad server & exchange with OpenRTB.

## docker-compose.yml

```
nginad:
  image: vimagick/nginad
  ports:
    - "80:80"
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

$ DOMAIN=nginad.foobar.site
$ docker exec nginad_nginad_1 sed -i "/adserver_domain/s/'.*'/'$DOMAIN'/" upload/public/ad/nginad.js
$ docker exec nginad_nginad_1 sed -i "s/server.nginad.com/$DOMAIN/" upload/config/autoload/delivery.local.php
$ docker exec nginad_nginad_1 sed -i "s/server.nginad.com/$DOMAIN/" upload/public/buytest.html

$ fig restart nginad
```

## test

Open test page in your browser: <http://nginad.foobar.site/buytest.html>

## admin

Now log into the Demand Customer and Publisher [dashboards][2] as admin and
start adding and configuring RTB campaigns.

- username: admin@localhost
- password: password

Log in as the default publisher account:

- username: sergey.page@blowmedianow.com
- password: password

Log in as the default demand customer account:

- username: larry.brin@suckmedianow.com
- password: password

[1]: https://nginad.atlassian.net/wiki/display/NGIN/nginad+Home
[2]: http://nginad.foobar.site/auth/login
