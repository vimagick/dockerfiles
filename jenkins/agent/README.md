jenkins/inbound-agent
=====================

## how to

- Enable TCP port 50000 for inbound agents: http://jenkins:8080/configureSecurity/
- Create New Node: http://jenkins:8080/computer/createItem
  - Name: docker-inbound-agent-1
  - Remote root directory: /home/jenkins/agent
  - Launch method: Launch agent by connecting it to the master
- Get Jenkins Secret: http://jenkins:8080/script/

```groovy
for (aSlave in hudson.model.Hudson.instance.slaves){
  println aSlave.name + "," + aSlave.getComputer().getJnlpMac()
}
```

## up and running

```bash
$ mkdir -p data/agent
$ chown -R 1000:1000 data
$ docker-compose up -d
```

## proxy

Edit two files in container to support proxy.

```bash
$ docker-compose exec --user root inbound-agent bash
>>> apt update
>>> apt install ncat vim
>>> exit
$ docker-compose exec inbound-agent bash
>>> mkdir -m 700 ~/.ssh
>>> vim -p ~/.ssh/config ~/.gitconfig
>>> exit
```

File: ~/.ssh/config

```
Host github.com
    Hostname github.com
    User git
    Proxycommand ncat --proxy x.x.x.x:1080 --proxy-type socks5 %h %p
```

File: ~/.gitconfig

```
[http "https://github.com"]
	proxy = http://x.x.x.x:8123
```
