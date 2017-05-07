#
# Dockerfile for scrapyd-onbuild
#

FROM vimagick/scrapyd
MAINTAINER kev <noreply@easypi.pro>

ONBUILD ADD ./*.txt /etc/scrapyd/
ONBUILD RUN cd /etc/scrapyd; \
            [ -f packages.txt -o -f dependencies.txt ] && apt-get update; \
            [ -f packages.txt ] && xargs -r apt-get install -y < packages.txt; \
            [ -f dependencies.txt ] && xargs -r apt-get install -y < dependencies.txt; \
            [ -f requirements.txt ] && pip install -r requirements.txt; \
            [ -f dependencies.txt ] && xargs -r apt-get purge -y --auto-remove < dependencies.txt; \
            [ -f packages.txt -o -f dependencies.txt ] && rm -rf /var/lib/apt/lists/*
