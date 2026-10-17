sniproxy (golang)
=================

## up and running

```bash
$ mkdir -p data
$ wget -O data/config.yaml https://github.com/mosajjal/sniproxy/raw/refs/heads/master/cmd/sniproxy/config.defaults.yaml
$ docker compose up -d
$ dig @127.0.0.1 www.youtube.com
```

## geoip filtering

```bash
cd data
TAG=$(curl -s https://api.github.com/repos/Loyalsoldier/geoip/releases/latest | jq -r '.tag_name')
BASE="https://github.com/Loyalsoldier/geoip/releases/download/${TAG}"
curl -L -o Country.mmdb "${BASE}/Country.mmdb"
curl -L -o Country.mmdb.sha256sum "${BASE}/Country.mmdb.sha256sum"
sha256sum -c Country.mmdb.sha256sum
```

```yaml
acl:
  geoip:
    enabled: true
    priority: 10
    blocked:
    allowed:
    - CN
    path: /etc/sniproxy/Country.mmdb
    refresh_interval: 24h0m0s
```

> [!Note]
> Another geoip data source: https://github.com/P3TERX/GeoLite.mmdb/tree/download
