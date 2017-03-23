collectd
========

`collectd` is a daemon which collects system performance statistics periodically
and provides mechanisms to store the values in a variety of ways, for example
in RRD files.

## directory tree

```
~/fig/collectd/
├── data/
│   ├── collectd.conf
│   └── conf.d/
│       └── network.conf
└── docker-compose.yml
```

## config files

collectd.conf

```apache
Hostname "localhost"

FQDNLookup false
Interval 10
Timeout 2
ReadThreads 5
WriteThreads 5

LoadPlugin cpu
LoadPlugin interface
LoadPlugin load
LoadPlugin memory

Include "/etc/collectd/conf.d/*.conf"
```

network.conf

```apache
LoadPlugin network

<Plugin "network">
  Server "influxdb" "25826"
</Plugin>
```

weather.conf

```apache
LoadPlugin curl_json

<Plugin curl_json>
  <URL "https://query.yahooapis.com/v1/public/yql?q=select%20item.condition%20from%20weather.forecast%20where%20woeid%3D2151330%20and%20u%3D'c'&format=json">
    Instance "Beijing"
    <Key "query/results/channel/item/condition/temp">
      Type "gauge"
    </Key>
  </URL>
  <URL "https://query.yahooapis.com/v1/public/yql?q=select%20item.condition%20from%20weather.forecast%20where%20woeid%3D2151849%20and%20u%3D'c'&format=json">
    Instance "Shanghai"
    <Key "query/results/channel/item/condition/temp">
      Type "gauge"
    </Key>
  </URL>
  <URL "https://query.yahooapis.com/v1/public/yql?q=select%20item.condition%20from%20weather.forecast%20where%20woeid%3D23511745%20and%20u%3D'c'&format=json">
    Instance "Silicon_Valley"
    <Key "query/results/channel/item/condition/temp">
      Type "gauge"
    </Key>
  </URL>
</Plugin>
```

## docker-compose.yml

```
collectd:
  image: vimagick/collectd
  volumes:
    - ./data:/etc/collectd
  pid: host
  net: host
  restart: always
```
