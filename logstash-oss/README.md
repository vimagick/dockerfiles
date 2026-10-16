logstash
========

## How It Works

![](https://www.elastic.co/assets/blt203883a0718cdc5a/filebeat-diagram.png)

```
log files ---> filebeat agent --+
...                             |
log files ---> filebeat agent --+> logstash container ---> aliyun™ log service
...                             |
log files ---> filebeat agent --+
```

## docker-compose.yml

```yaml
logstash:
  image: docker.elastic.co/logstash/logstash:6.1.1
  ports:
    - "5044:5044"
    - "9600:9600"
  volumes:
    - ./data/logstash.yml:/usr/share/logstash/config/logstash.yml
    - ./data/pipeline:/usr/share/logstash/pipeline
    - /usr/share/logstash/vendor/bundle
  environment:
    LS_JAVA_OPTS: "-Xms1g -Xmx1g"
  restart: always
```

## Up and Running

```bash
$ docker-compose up -d
$ docker-compose exec logstash bash
>>> logstash-plugin install logstash-output-logservice
Validating logstash-output-logservice
Installing logstash-output-logservice
Installation successful
>>> logstash-plugin list
logstash-output-logservice
>>> exit
$ vim data/pipeline/logstash.conf
$ docker-compose exec logstash kill -HUP 1
$ docker-compose logs -f
$ curl http://localhost:9600
{
  "host": "easypi",
  "version": "6.1.1",
  "http_address": "0.0.0.0:9600",
  "id": "c7c4f9d7-5621-4375-bfc9-96abb0f1b4c3",
  "name": "6848fe4c533f",
  "build_date": "2017-12-17T21:51:17+00:00",
  "build_sha": "d46ca0de31662d29b8c5c94d4162e4c760d3f8fb",
  "build_snapshot": false
}
```

You can install logstash plugin manually:

- /usr/share/logstash/vendor/bundle/jruby/2.3.0/specifications/logstash-output-logservice-0.3.0.gemspec
- /usr/share/logstash/vendor/bundle/jruby/2.3.0/gems/logstash-output-logservice-0.3.0/

## Setup Filebeat

```bash
# https://www.elastic.co/downloads/beats/filebeat
$ wget https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-6.1.1-amd64.deb
$ dpkg -i filebeat-6.1.1-amd64.deb
$ vim /etc/filebeat/filebeat.yml
#output.elasticsearch:
  # Array of hosts to connect to.
  #hosts: ["localhost:9200"]
output.logstash:
  # The Logstash hosts
  hosts: ["1.2.3.4:5044"]
$ systemctl start filebeat
$ systemctl enable filebeat
```

Download filebeat binary for raspberry pi [here][1].

## References

- https://www.elastic.co/guide/en/logstash/current/getting-started-with-logstash.html
- https://www.elastic.co/guide/en/beats/filebeat/current/filebeat-getting-started.html
- https://www.alibabacloud.com/help/zh/doc-detail/28984.htm

[1]: https://github.com/vimagick/rpi-bin/raw/master/bin/filebeat-6.1.1-armv7h.gz
