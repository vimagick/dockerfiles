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
    - ./sql:/docker-entrypoint-initdb.d
  environment:
    - MYSQL_ROOT_PASSWORD=root
  restart: always
```

## references

- <https://wiki.zoneminder.com/Ubuntu_Server_16.04_64-bit_with_Zoneminder_1.29.0_the_easy_way>
- <https://chiralsoftware.com/content/zoneminder-nginx-yes-it-works>

[1]: https://www.zoneminder.com/
