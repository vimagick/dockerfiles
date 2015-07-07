urlwatch
========

[urlwatch][1] - a tool for monitoring webpages for updates

## docker-compose.yml

```yaml
urlwatch:
  image: vimagick/urlwatch
  volumes:
    - urlwatch/Makefile:/root/.urlwatch/Makefile
    - urlwatch/urls.yml:/root/.urlwatch/urls.yml
  restart: always
```

## Makefile

```Makefile
SHELL = /bin/bash
PATH := /usr/local/bin:$(PATH)

SMTP = smtp.datageek.info:587
FROM = urlwatch@datageek.info
PASS = password
TO = noreply@datageek.info

all: setup urls.txt
	urlwatch -s $(SMTP) -f $(FROM) -t $(TO) -A -T

urls.txt: urls.yml
	python lib/hooks.py

setup:
	python -c 'import keyring; keyring.set_password("$(SMTP)", "$(FROM)", "$(PASS)")'
```

> Please change `STMP`/`FROM`/`PASS`/`TO`


## urls.yml

```yaml
python:
  url: https://www.python.org/downloads/
  exp: //div[@class="download-unknown"]/p[@class]/a[1]/text()

ubuntu:
  url: http://www.ubuntu.com/download/server
  exp: //div[contains(@class, "row-hero")]//h2/text()

scrapy:
  url: https://github.com/scrapy/scrapy/releases
  exp: //ul[@class="release-timeline-tags"]/li[1]//span[@class="tag-name"]/text()

urlwatch:
  url: https://github.com/thp/urlwatch/releases
  exp: //ul[@class="release-timeline-tags"]/li[1]//span[@class="tag-name"]/text()
```

[1]: thp.io/2008/urlwatch/
