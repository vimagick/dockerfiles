ELK
===

- Elasticsearch
- Logstash
- Kibana

## How it works

![](https://logz.io/wp-content/uploads/2017/03/elk-pipeline-in-docker-environment.png)

## Up and running

```bash
$ sysctl -w vm.max_map_count=262144
$ vi /etc/sysctl.conf
  vm.max_map_count = 262144
$ chown -R 1000:1000 data
$ docker-compose up -d
```

## Delete indices older than 7 days

```yaml
---
actions:
  1:
    action: delete_indices
    description: >-
      Delete indices older than 7 days (based on index name), for logstash-
      prefixed indices. Ignore the error if the filter does not result in an
      actionable list of indices (ignore_empty_list) and exit cleanly.
    options:
      ignore_empty_list: True
      disable_action: False
    filters:
    - filtertype: pattern
      kind: prefix
      value: logstash-
    - filtertype: age
      source: name
      direction: older
      timestring: '%Y.%m.%d'
      unit: days
      unit_count: 7
```

```bash
$ pip install elasticsearch-curator
$ curator delete-indices.yml
```

## Send container's log to ELK

```nginx
input {
  gelf {
    port => 12201
  }
}
```

```yaml
test:
  image: alpine
  command: 'sh -c "while :; do date; sleep 1; done"'
  log_driver: gelf
  log_opt:
    gelf-address: udp://x.x.x.x:12201
    tag: test
```

Search `tag: test` in kibana to show recent logging.

