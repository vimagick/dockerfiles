elasticdump
===========

```bash
$ alias elasticdump='docker run --rm --net host -v $PWD:/data -w /data elasticdump/elasticsearch-dump'
$ query='{"query": {"query_string": {"query": "+hello:world +foo:bar"}}}'
$ elasticdump --input=http://127.0.0.1:9200/index_name output=result.json --searchBody="$query"
```
