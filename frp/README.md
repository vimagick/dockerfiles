frp
===

[frp][1] is a fast reverse proxy to help you expose a local server behind a NAT
or firewall to the internet. Now, it supports tcp, udp, http and https protocol
when requests can be forwarded by domains to backward web services.

```yaml
version: "3.8"
services:
  frps:
    image: vimagick/frp
    volumes:
      - ./data:/opt/frp/etc
    healthcheck:
      test: ["CMD", "curl", "-f", "-u", "admin:admin", "http://127.0.0.1:7500/healthz"]
      interval: 1m
      timeout: 5s
    network_mode: host
    restart: unless-stopped
```

Sample config file: [frps.ini][2]

[1]: https://github.com/fatedier/frp
[2]: https://github.com/fatedier/frp/blob/master/conf/frps_full.ini
