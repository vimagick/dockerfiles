dnsmasq
=======

[Dnsmasq][1] is a Domain Name System forwarder and Dynamic Host Configuration
Protocol server for small computer networks, created as free software.

## DNS Server for WORK

```bash
$ tree
├── data
│   ├── nsfw.txt
│   └── settings.conf
└── docker-compose.yml

$ docker-compose up -d

$ docker-compose kill -s SIGHUP
```

```ini
# settings.conf

no-hosts
no-resolv
filter-AAAA
cache-size=10000
server=8.8.8.8
servers-file=/etc/dnsmasq.d/nsfw.txt
```

```bash
curl -s https://thepornbest.com/ |
  htmlq -a href a |
    grep '://' |
      sort -u |
        xargs tldextract -j |
          jq -r 'select(.registered_domain!="").registered_domain' |
            sort -u |
              sed 's@.*@server=/&/@' > data/nsfw.txt
```

[1]: http://www.thekelleys.org.uk/dnsmasq/doc.html
