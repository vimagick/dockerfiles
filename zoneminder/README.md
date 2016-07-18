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
    - "127.0.0.1:8080:80"
  links:
    - mysql
  volumes:
    - ./fcgiwrap:/etc/default/fcgiwrap
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

## fcgiwrap

```bash
FCGI_CHILDREN=4
```

## /etc/nginx/sites-enabled/default

```
server {
    listen 80;
    server_name zm.easypi.info;
    location = / {
      return 301 /zm/;
    }
    location /zm/ {
        auth_basic "Restricted";
        auth_basic_user_file /etc/nginx/htpasswd;
        proxy_pass http://127.0.0.1:8080;
    }
}
```

## /etc/nginx/htpasswd

```
user:$apr1$zLX30Ahb$S0pZUiZW676E0gTplhpie0
```

## up and running

```bash
$ docker-compose up -d
```

- Open <http://zm.easypi.info/>
- Add New Monitor
  - Click Presets: 640x480, mpjpeg
  - Change Source
    - Remote Host Name: user:pass@x.x.x.x
    - Remote Host Port: 8080
    - Remote Host Path: /?action=stream
  - Save
- Run State: Stopped -> Running
- Click `Monitor-1`

> I'm running `mjpg-streamer` on OpenWrt.

## references

- <https://wiki.zoneminder.com/Ubuntu_Server_16.04_64-bit_with_Zoneminder_1.29.0_the_easy_way>
- <https://chiralsoftware.com/content/zoneminder-nginx-yes-it-works>
- <https://forums.zoneminder.com/viewtopic.php?p=55482>
- <https://dev.mysql.com/doc/refman/5.7/en/option-files.html>
- <http://www.htaccesstools.com/htpasswd-generator/>

[1]: https://www.zoneminder.com/
