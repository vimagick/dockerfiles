nanomq
======

[NanoMQ][1] MQTT Broker (NanoMQ) is an all-around Edge Messaging Platform that
includes a blazing-fast MQTT Broker for the IoT/IIoT and a lightweight
Messaging Bus for SDV.

## up and running

```bash
$ mkdir -p data/{etc,log,var}
$ cd data/etc
$ wget https://github.com/nanomq/nanomq/raw/master/etc/nanomq.conf
$ vi nanomq.conf
$ ssh-keygen -t rsa -b 4096 -m PEM -N '' -f jwtRS256.key
$ openssl rsa -in jwtRS256.key -pubout -outform PEM -out jwtRS256.key.pub
$ docker compose up -d
$ curl -u admin:public http://192.168.42.156:8081/api/v4/brokers
```

## quick start

```bash
$ mosquitto_sub -h 127.0.0.1 -p 1883 -t test -v
$ mosquitto_pub -h 127.0.0.1 -p 1883 -t test -m hello
```

## rule engine

By default, the rule engine function is disabled. To enable it, please compile
with the [-DENABLE_RULE_ENGINE=ON][2] option.

```bash
$ echo 'create table test(topic text, payload text)' | sqlite3 -cmd '.mode csv' data/var/test.db
$ echo 'select * from test' | sqlite3 -cmd '.mode csv' data/var/test.db
```

[1]: https://github.com/nanomq/nanomq/tree/master
[2]: https://nanomq.io/docs/en/latest/installation/build-options.html
