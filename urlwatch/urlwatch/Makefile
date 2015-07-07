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
