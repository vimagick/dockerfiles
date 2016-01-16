discuz
======

[Discuz!][1] is an internet forum software written in PHP and developed by a chinese company.

:-1: Discuz! is not a open source software.

- Initial release: March 2002
- Stable release: X3.2 (September 23, 2013; 2 years ago)
- License: proprietary (costs about ¥3000)

:+1: Try open source softwares:

- [discourse](https://hub.docker.com/r/discourse/discourse/)
- [nodebb](https://hub.docker.com/r/vimagick/phpbb/)
- [phpbb](https://hub.docker.com/r/vimagick/phpbb/)

## docker-compose.yml

```
discuz:
  image: vimagick/discuz
  ports:
    - "8000:80"
  links:
    - mysql
  restart: always

mysql:
  image: mysql
  environment:
    - MYSQL_ROOT_PASSWORD=root
    - MYSQL_DATABASE=discuz
    - MYSQL_USER=discuz
    - MYSQL_PASSWORD=discuz
  restart: always
```

[1]: http://www.discuz.net
