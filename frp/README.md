frp
===

[frp][1] is a fast reverse proxy to help you expose a local server behind a NAT
or firewall to the internet. Now, it supports tcp, udp, http and https protocol
when requests can be forwarded by domains to backward web services.

```yaml
frps:
  image: vimagick/frp
  ports:
    - "7000:7000/tcp"
    - "7000:7000/udp"
    - "7500:7500/tcp"
    - "127.0.0.1:20000-20099:20000-20099/tcp"
  volumes:
    - ./data/frps.ini:/opt/frp/frps.ini
  restart: always
```

Sample config file: [frps.ini][2]

[1]: https://github.com/fatedier/frp
[2]: https://github.com/fatedier/frp/blob/master/conf/frps_full.ini
