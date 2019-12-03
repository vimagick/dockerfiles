jenkins
=======

![](https://badge.imagelayers.io/jenkinsci/jenkins:latest.svg)

In a nutshell, [Jenkins][1] is the leading open source automation server. Built
with Java, it provides hundreds of plugins to support building, testing,
deploying and automation for virtually any project.

## docker-compose.yml

```yaml
jenkins:
  image: jenkins/jenkins:lts-alpine
  ports:
    - "8080:8080"
    - "50000:50000"
  volumes:
    - ./data:/var/jenkins_home
  environment:
    - JAVA_OPTS=-Dhudson.footerURL=http://jenkins.easypi.pro
  restart: always
```

## up and running

```bash
$ cd ~/fig/jenkins
$ mkdir -p data
$ sudo chown 1000 data
$ docker-compose up -d
$ docker-compose exec jenkins bash
>>> cat ~/secrets/initialAdminPassword
******
>>> ssh-keygen
>>> cat ~/.ssh/id_rsa.pub
......
>>> exit
$ docker-compose exec --user root jenkins apk add -U git
$ firefox http://localhost:8080/
```

## fix slow network

```
$ vim data/war/jsbundles/pluginSetupWizard.js
    // default 10 seconds for AJAX responses to return before triggering an error condition
    var pluginManagerErrorTimeoutMillis = 10 * 1000;
```

> Chinese users may add `-Dhudson.model.DownloadService.noSignatureCheck=true` option to use [plugin update mirror site][2].

[1]: https://jenkins.io/index.html
[2]: https://mirrors.tuna.tsinghua.edu.cn/jenkins/updates/current/update-center.json
