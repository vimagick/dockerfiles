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
