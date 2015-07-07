#
# Dockerfile for urlwatch
#

FROM alpine
MAINTAINER kev <noreply@datageek.info>

RUN apk add -U ca-certificates \
               build-base \
               libxml2 \
               libxml2-dev \
               libxslt \
               libxslt-dev \
               make \
               python-dev \
               py-pip \
    && pip install keyring \
                   lxml \
                   urlwatch \
                   pyyaml \
    && apk del build-base \
               libxml2-dev \
               libxslt-dev \
               python-dev \
    && rm -rf /var/cache/apk/* \
    && echo '*/15 * * * * cd ~/.urlwatch && make' | crontab

COPY urlwatch /root/.urlwatch

CMD ["crond", "-f", "-L", "/dev/stdout"]
