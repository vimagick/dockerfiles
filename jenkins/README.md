jenkins
=======

![](https://badge.imagelayers.io/jenkinsci/jenkins:latest.svg)

[Jenkins][1] is the leading open source automation server. Built with Java,
it provides hundreds of plugins to support building, testing, deploying and
automation for virtually any project.

Read [more](https://github.com/jenkinsci/docker) about this docker image.

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
$ curl http://localhost:8080/
```

## download jdk and agent.jar

- https://www.oracle.com/java/technologies/downloads/#jdk23-linux
- http://localhost:8080/jnlpJars/agent.jar

## fix slow network

```bash
$ vim data/war/jsbundles/pluginSetupWizard.js
    // default 10 seconds for AJAX responses to return before triggering an error condition
    var pluginManagerErrorTimeoutMillis = 10 * 1000;
```

> :cn: Chinese users may add `-Dhudson.model.DownloadService.noSignatureCheck=true` option to use [plugin update mirror site][2].

[1]: https://jenkins.io/index.html
[2]: https://mirrors.tuna.tsinghua.edu.cn/jenkins/updates/current/update-center.json
