ElastAlert
==========

[ElastAlert][1] is a simple framework for alerting on anomalies, spikes, or other
patterns of interest from data in Elasticsearch.

## up and running

```bash
$ docker-compose up -d
$ docker-compose exec elastalert sh
>>> cd /opt/elastalert/rules
>>> elastalert-test-rule example.yaml
>>> exit
```

> ElastAlert will also load new rules, stop running missing rules, and restart
> modified rules as the files in this folder change.

[1]: http://elastalert.readthedocs.io/en/latest/
