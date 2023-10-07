ElastAlert
==========

[ElastAlert][1] is a simple framework for alerting on anomalies, spikes, or other
patterns of interest from data in Elasticsearch.

## up and running

```bash
$ docker-compose run --rm elastalert sh
>>> curl -X DELETE http://elasticsearch:9200/elastalert_*
>>> elastalert-create-index --config config.yaml
>>> elastalert-test-rule --config config.yaml --alert rules/example.yaml
>>> exit

$ docker-compose up -d

$ docker-compose logs -tf
Attaching to elastalert_elastalert_1
elastalert_1  | 2019-10-30T13:53:46.193793451Z bad things happen
elastalert_1  | 2019-10-30T13:58:45.855636764Z bad things happen
elastalert_1  | 2019-10-30T14:03:46.444137134Z bad things happen
```

> ElastAlert will also load new rules, stop running missing rules, and restart
> modified rules as the files in this folder change.

[1]: https://elastalert2.readthedocs.io/en/latest/
