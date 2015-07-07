SHELL = /bin/bash
PATH := /usr/local/bin:$(PATH)

SMTP = smtp.datageek.info:587
FROM = urlwatch@datageek.info
TO = noreply@datageek.info

all: urls.txt
	urlwatch -s $(SMTP) -f $(FROM) -t $(TO) -A -T

urls.txt: urls.yml
	python lib/hooks.py

