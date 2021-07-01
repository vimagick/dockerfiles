#
# Dockerfile for scrapyd-onbuild (python3)
#

FROM vimagick/scrapyd:py3
MAINTAINER EasyPi Software Foundation

ONBUILD ADD ./*.txt /etc/scrapyd/
ONBUILD RUN cd /etc/scrapyd; \
            [ -f packages.txt -o -f dependencies.txt ] && apt-get update; \
            [ -f packages.txt ] && xargs -r apt-get install -y < packages.txt; \
            [ -f dependencies.txt ] && xargs -r apt-get install -y < dependencies.txt; \
            [ -f requirements.txt ] && pip install --no-cache-dir -r requirements.txt; \
            [ -f dependencies.txt ] && xargs -r apt-get purge -y --auto-remove < dependencies.txt; \
            [ -f packages.txt -o -f dependencies.txt ] && rm -rf /var/lib/apt/lists/*
