jenkins
=======

![](https://badge.imagelayers.io/vimagick/jenkins:latest.svg)

In a nutshell, [Jenkins][1] is the leading open source automation server. Built
with Java, it provides hundreds of plugins to support building, testing,
deploying and automation for virtually any project.

## docker-compose.yml

```yml
jenkins:
  image: jenkins:alpine
  ports:
    - "8080:8080"
    - "50000:50000"
  volumes:
    - ./data:/var/jenkins_home
  environment:
    - JAVA_OPTS=-Dhudson.footerURL=http://easypi.info/
  restart: always
```

## up and running

```
$ cd ~/fig/jenkins
$ mkdir -p data
$ sudo chown 1000 data
$ docker-compose up -d
$ docker-compose exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword
$ firefox http://localhost:8080/
```

[1]: http://jenkins-ci.org/
