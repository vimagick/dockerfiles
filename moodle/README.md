moodle
======

[Moodle][1] is a learning platform designed to provide educators,
administrators and learners with a single robust, secure and integrated system
to create personalised learning environments.

## docker-compose.yml

```
moodle:
  image: vimagick/moodle
  ports:
    - "8000:80"
  links:
    - mysql
  volumes:
    - ./moodledata:/var/www/moodledata
  restart: always

mysql:
  image: mysql
  environment:
    - MYSQL_ROOT_PASSWORD=root
    - MYSQL_DATABASE=moodle
  restart: always
```

## up and running

```
$ cd ~/fig/moodle/
$ mkdir -p moodledata
$ chmod 777 moodledata
$ docker-compose up -d
```

[1]: https://moodle.org/
