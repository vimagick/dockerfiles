urlwatch
========

[urlwatch][1] is a tool for monitoring webpages for updates.

```
cron: triggered every 15 minutes
    -> make: generate urls.txt from urls.yml
        -> urlwatch: fetch webpages
            -> hooks.py: extract info
                -> email: send via smtp
                    -> (^_^)
```

## docker-compose.yml

```
urlwatch:
  image: vimagick/urlwatch
  volumes:
    - urlwatch/Makefile:/root/.urlwatch/Makefile
    - urlwatch/urls.yml:/root/.urlwatch/urls.yml
  restart: always
```

## Makefile

```
SHELL = /bin/sh
PATH := /usr/local/bin:$(PATH)

SMTP = smtp.easypi.info:587
FROM = urlwatch@easypi.info
PASS = password
TO = noreply@easypi.info

all: setup urls.txt
	urlwatch -s $(SMTP) -f $(FROM) -t $(TO) -A -T

urls.txt: urls.yml
	python lib/hooks.py

setup:
	python -c 'import keyring; keyring.set_password("$(SMTP)", "$(FROM)", "$(PASS)")'
```

> Please change `STMP`/`FROM`/`PASS`/`TO` to correct value.

## urls.yml

```
python:
  url: https://www.python.org/downloads/
  exp: //div[@class="download-unknown"]/p[@class]/a[1]/text()

ubuntu:
  url: http://www.ubuntu.com/download/server
  exp: //div[contains(@class, "row-hero")]//h2/text()

coreos:
  url: https://coreos.com
  exp: //div[@class="co-p-homepage-release-text"]/text()

urlwatch:
  url: https://github.com/thp/urlwatch/releases
  exp: //ul[@class="release-timeline-tags"]/li[1]//span[@class="tag-name"]/text()
```

## Email alert

```
***************************************************************************
CHANGED: https://coreos.com#coreos
***************************************************************************
--- @   Tue, 07 Jul 2015 17:15:01 +0000
+++ @   Tue, 07 Jul 2015 20:00:01 +0000
@@ -1 +1 @@
-coreos: 723.1.0
+coreos: 735.0.0

***************************************************************************
```

[1]: thp.io/2008/urlwatch/
