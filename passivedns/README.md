passivedns
==========

[PassiveDNS][1] is a tool to collect DNS records passively to aid Incident handling, Network
Security Monitoring (NSM) and general digital forensics.

## docker-compose.yml

```yaml
version: "3.8"
services:
  passivedns:
    image: vimagick/passivedns
    command: >
      -i eth0
      -l /var/log/passivedns/passivedns.log
      -L /var/log/passivedns/passivedns-nx.log
      -p /var/run/passivedns.pid
      -P 86400
      -S 256
      -X 46CDNOPRSTMnx
    volumes:
      - ./data:/var/log/passivedns
    network_mode: host
    privileged: true
    restart: unless-stopped
```

## filebeat.yml

```yaml
filebeat.inputs:
- type: filestream
  id: passivedns
  paths:
    - /path/to/passivedns/data/passivedns.log
    - /path/to/passivedns/data/passivedns-nx.log
  ignore_inactive: since_first_start
  fields:
    project: dns
  fields_under_root: true
  processors:
    - include_fields:
        fields: ["message", "project"]

output.logstash:
  hosts: ["logstash:5044"]
```

## logstash.conf

```
input {
  beats {
    port => 5044
  }
}

filter {
  if [project] == "dns" {
    csv {
      separator => "||"
      columns => [ "timestamp", "client", "server", "class", "query", "type", "answer", "ttl", "count" ]
      convert => {
        "ttl" => "integer"
        "count" => "integer"
      }
    }
    date {
      match => [ "timestamp", "UNIX" ]
      remove_field => [ "timestamp" ]
    }
    mutate {
      gsub => [ "query", "\.$", "", "answer", "\.$", "" ]
      remove_field => [ "[host]", "[agent]", "[ecs][version]", "message" ]
    }
  } else {
    drop {}
  }
}

output {
  elasticsearch {
    hosts => ["elasticsearch:9200"]
    ilm_enabled => "false"
  }
}
```

[1]: https://github.com/gamelinux/passivedns
