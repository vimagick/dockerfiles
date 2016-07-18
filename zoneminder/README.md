zoneminder
==========

![](https://badge.imagelayers.io/vimagick/zoneminder:latest.svg)

[ZoneMinder][1] is a full-featured, open source, state-of-the-art video
surveillance software system. Monitor your home, office, or wherever you want.
Using off the shelf hardware with any camera, you can design a system as large
or as small as you need.

## docker-compose.yml

```yaml
zoneminder:
  image: vimagick/zoneminder
  ports:
    - "8080:80"
  links:
    - mysql
  restart: always

mysql:
  image: mysql
  volumes:
    - ./mysql/my.cnf:/etc/mysql/conf.d/my.cnf
    - ./mysql:/docker-entrypoint-initdb.d
    - /usr/share/zoneinfo/Asia/Shanghai:/etc/localtime
  environment:
    - MYSQL_ROOT_PASSWORD=root
  restart: always
```

> - `timezone = Asia/Shanghai` was hard-coded in Dockerfile.
> - Make sure two containers have the same timezone.

## up and running

```bash
$ docker-compose up -d
```

- Open <http://localhost:8080/zm/>
- Add New Monitor
  - Click Presets
  - Change Source
  - Save
- Run State: Stopped -> Running

## references

- <https://wiki.zoneminder.com/Ubuntu_Server_16.04_64-bit_with_Zoneminder_1.29.0_the_easy_way>
- <https://chiralsoftware.com/content/zoneminder-nginx-yes-it-works>
- <https://forums.zoneminder.com/viewtopic.php?p=55482>
- <https://dev.mysql.com/doc/refman/5.7/en/option-files.html>

[1]: https://www.zoneminder.com/
