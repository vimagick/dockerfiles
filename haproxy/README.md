haproxy
=======

![](https://badge.imagelayers.io/library/haproxy:alpine.svg)

[HAProxy][1] is a free, open source high availability solution, providing load
balancing and proxying for TCP and HTTP-based applications by spreading
requests across multiple servers.

## docker-compose.yml

```yaml
haproxy:
  image: haproxy:alpine
  volumes:
    - ./haproxy.cfg:/usr/local/etc/haproxy/haproxy.cfg
  net: host
  restart: always
```

## haproxy.cfg

This sample config shows you how to setup a simple tcp load balancer.

```
#                       +- jp (:1081)
#                       |
#                       |- tw (:1082)
# frontend --- backend -+  
# (*:1080)              |- hk (:1083)
#                       |
#                       +- us (:1084)

global
        # daemon # WARNING: DO NOT USE IT!
        maxconn 4000

defaults
        mode tcp
        timeout connect 5000ms
        timeout client 50000ms
        timeout server 50000ms

frontend front
        bind *:1080
        default_backend back

backend back
        balance roundrobin
        server jp 127.0.0.1:1081 weight 50
        server tw 127.0.0.1:1082 weight 20
        server hk 127.0.0.1:1083 weight 15
        server us 127.0.0.1:1084 weight 15
```

> :warning: haproxy must not be daemonized!

[1]: http://www.haproxy.org/
