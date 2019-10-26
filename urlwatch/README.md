urlwatch
========

[urlwatch][1] is a tool for monitoring webpages for updates.

## docker-compose.yml

```yaml
urlwatch:
  image: vimagick/urlwatch
  volumes:
    - ./data:/root/.urlwatch
  restart: unless-stopped
```

## urls.yaml

```yaml
---

url: "https://github.com/thp/urlwatch/releases/latest"
filter:
- xpath: '(//div[contains(@class,"release-timeline-tags")]//h4)[1]/a'
- html2text: re

---

url: "https://github.com/shadowsocks/shadowsocks-libev/releases/latest"
filter:
- css: 'div.f1>a'
- html2text: re

...
```

## up and running

```bash
$ docker-compose up -d
$ docker-compose exec urlwatch sh
>>> urlwatch --test-slack
Successfully sent message to Slack
>>> urlwatch --list
1: https://github.com/thp/urlwatch/releases/latest
2: https://github.com/shadowsocks/shadowsocks-libev/releases/latest
>>> urlwatch --test-filter 2
v3.2.5
>>> exit
```

[1]: https://thp.io/2008/urlwatch/
