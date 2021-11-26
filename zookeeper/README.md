zookeeper
=========

![](http://zookeeper.apache.org/images/zookeeper_small.gif)

Apache [ZooKeeper][1] is an effort to develop and maintain an open-source server
which enables highly reliable distributed coordination.


## docker-compose.yml

```yaml
version: "3.8"
services:
  zookeeper:
    image: zookeeper
    ports:
      - "2181:2181"
    volumes:
      - ./data/data:/data
      - ./data/datalog:/datalog
      - ./data/logs:/logs
    environment:
      - ZOO_LOG4J_PROP=INFO,ROLLINGFILE
      - ZOO_STANDALONE_ENABLED=true
    restart: unless-stopped
```

## Standalone Mode

```bash
$ docker-compose up -d

$ docker-compose exec zookeeper cat /conf/zoo.cfg

$ docker-compose exec zookeeper zkServer.sh status
ZooKeeper JMX enabled by default
Using config: /conf/zoo.cfg
Client port found: 2181. Client address: localhost.
Mode: standalone

$ docker-compose exec zookeeper zkCli.sh
>>> help
>>> create /hello world
>>> get /hello
>>> delete /hello
>>> quit
```

Click [this][2] to learn more.

## Cluster Mode

See: https://github.com/vimagick/dockerfiles/tree/master/kafka

[1]: http://zookeeper.apache.org/
[2]: https://zookeeper.apache.org/doc/trunk/zookeeperStarted.html
