collectd
========

`collectd` is a daemon which collects system performance statistics periodically
and provides mechanisms to store the values in a variety of ways, for example
in RRD files.

## directory tree

```
~/fig/collectd/
├── collectd/
│   ├── collectd.conf
│   └── conf.d/
│       └── network.conf
└── docker-compose.yml
```

## config files

collectd.conf

```
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

```
LoadPlugin network

<Plugin "network">
  Server "influxdb" "25826"
</Plugin>
```

## docker-compose.yml

```
collectd:
  image: vimagick/collectd
  volumes:
    - ./collectd:/etc/collectd
  pid: host
  net: host
  restart: always
```
