#
# Dockerfile for urlwatch
#

FROM alpine
MAINTAINER kev <noreply@easypi.pro>

RUN set -xe \
    && apk add --no-cache ca-certificates \
                          build-base      \
                          libffi-dev      \
                          libxml2         \
                          libxml2-dev     \
                          libxslt         \
                          libxslt-dev     \
                          openssl-dev     \
                          python3         \
                          python3-dev     \
                          openssl-dev \
    && python3 -m pip install appdirs   \
                              cssselect \
                              keyring   \
                              lxml      \
                              minidb    \
                              pyyaml    \
                              requests  \
                              urlwatch  \
    && apk del build-base  \
               libffi-dev  \
               libxml2-dev \
               libxslt-dev \
               make \
               python-dev \
               py-pip \
    && pip install cssselect \
                   futures \
                   keyring \
                   lxml \
                   urlwatch \
                   pyyaml \
                   keyrings.alt \
    && apk del build-base \
               libxml2-dev \
               libxslt-dev \
               python-dev \
    && rm -rf /var/cache/apk/* \
    && echo '*/15 * * * * cd ~/.urlwatch && make' | crontab -

VOLUME /root/.urlwatch
WORKDIR /root/.urlwatch

CMD ["crond", "-f", "-L", "/dev/stdout"]
