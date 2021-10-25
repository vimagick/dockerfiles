urlwatch
========

[urlwatch][1] is a tool for monitoring webpages for updates.

## docker-compose.yml

```yaml
version: "3.8"
services:
  urlwatch:
    image: vimagick/urlwatch
    volumes:
      - ./data:/root/.urlwatch
    restart: unless-stopped
```

## urls.yaml

```yaml
---

name: urlwatch
url: "https://github.com/thp/urlwatch/tags"
filter:
- xpath: '(//h4[@data-test-selector="tag-title"]/a)[1]'
- html2text: re
- strip:

---

name: shadowsocks-libev
url: "https://github.com/shadowsocks/shadowsocks-libev/releases/latest"
filter:
- css: "div.flex-1>h1"
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
v3.3.5
>>> exit
```

[1]: https://thp.io/2008/urlwatch/

## customizing cron schedule

### Create a crontab file

```
*/30 * * * * cd /root/.urlwatch && urlwatch --urls urls.yaml --config urlwatch.yaml --hooks hooks.py --cache cache.db
*/15 * * * * cd /root/.urlwatch && urlwatch --urls urls-every-15m.yaml --config urlwatch.yaml --hooks hooks.py --cache cache.db
```

See the [crontab manpage for details on format](https://man7.org/linux/man-pages/man5/crontab.5.html#DESCRIPTION).

### Mount the crontab file as a docker volume

```yaml
version: "3.8"
services:
  urlwatch:
    image: vimagick/urlwatch
    volumes:
      - ./data:/root/.urlwatch
      - ./data/crontab:/etc/crontabs/root
    restart: unless-stopped
```
