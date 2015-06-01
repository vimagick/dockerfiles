#
# Dockerfile for scrapyd-onbuild
#

FROM vimagick/scrapyd
MAINTAINER kev <noreply@datageek.info>

ONBUILD ADD ./*.txt /etc/scrapyd/
ONBUILD RUN apt-get update \
            && cd /etc/scrapyd \
            && [[ -f packages.txt ]] && xargs -r apt-get install -y < packages.txt \
            && [[ -f dependencies.txt ]] && xargs -r apt-get install -y < dependencies.txt \
            && [[ -f requirements.txt ]] && pip install -r requirements.txt \
            && [[ -f dependencies.txt ]] && xargs -r apt-get purge -y --auto-remove < dependencies.txt \
            && rm -rf /usr/lib/apt/lists/*
