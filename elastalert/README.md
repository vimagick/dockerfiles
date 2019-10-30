ElastAlert
==========

[ElastAlert][1] is a simple framework for alerting on anomalies, spikes, or other
patterns of interest from data in Elasticsearch.

## up and running

```bash
$ docker-compose run --rm elastalert sh
>>> elastalert-create-index --config config.yaml
>>> elastalert-test-rule --config config.yaml rules/example.yaml
>>> exit

$ docker-compose up -d

$ docker-compose logs -tf
elastalert_1  | 2019-10-30T10:33:31.960452334Z bad things happend
elastalert_1  | 2019-10-30T10:42:27.952772739Z bad things happend
elastalert_1  | 2019-10-30T10:50:22.808460534Z bad things happend
```

> ElastAlert will also load new rules, stop running missing rules, and restart
> modified rules as the files in this folder change.

[1]: http://elastalert.readthedocs.io/en/latest/
