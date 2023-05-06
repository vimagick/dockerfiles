fluent-bit
==========

[Fluent Bit][1] is a fast Log Processor and Forwarder for Linux, Windows, Embedded
Linux, MacOS and BSD family operating systems. It's part of the Graduated
Fluentd Ecosystem and a CNCF sub-project.


```bash
$ mkdir -p data/{etc,var}
$ wget -P data/etc https://github.com/fluent/fluent-bit/raw/master/conf/fluent-bit.conf \
                   https://github.com/fluent/fluent-bit/raw/master/conf/parsers.conf \
                   https://github.com/fluent/fluent-bit/raw/master/conf/plugins.conf
$ docker-compose up -d
$ docker-compose logs --tail 10 -f
```

[1]: https://github.com/fluent/fluent-bit
