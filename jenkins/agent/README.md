jenkins/inbound-agent
=====================

## how to

- Enable TCP port 50000 for inbound agents: http://jenkins:8080/configureSecurity/
- Create New Node: http://jenkins:8080/computer/
- Get Jenkins Secret: http://jenkins:8080/script/

```groovy
for (aSlave in hudson.model.Hudson.instance.slaves){
  println aSlave.name + "," + aSlave.getComputer().getJnlpMac()
}
```

## up and running

```bash
$ mkdir -p data
$ chown 1000:1000 data
$ docker-compose up -d
```
