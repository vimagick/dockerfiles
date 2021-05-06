#
# Dockerfile for urlwatch
#

FROM alpine:3
LABEL maintainer="EasyPi Software Foundation"

RUN set -xe \
    && apk add --no-cache ca-certificates  \
                          build-base       \
                          libffi-dev       \
                          libxml2          \
                          libxml2-dev      \
                          libxslt          \
                          libxslt-dev      \
                          openssl-dev      \
                          py3-cryptography \
                          py3-pip          \
                          python3          \
                          python3-dev      \
    && pip3 install appdirs        \
                    cssselect      \
                    keyring        \
                    lxml           \
                    minidb         \
                    pyyaml         \
                    requests       \
                    chump          \
                    beautifulsoup4 \
                    pushbullet.py  \
                    urlwatch       \
    && apk del build-base  \
               libffi-dev  \
               libxml2-dev \
               libxslt-dev \
               openssl-dev \
               python3-dev \
    && echo '*/30 * * * * cd /root/.urlwatch && urlwatch --urls urls.yaml --config urlwatch.yaml --hooks hooks.py --cache cache.db' | crontab -

VOLUME /root/.urlwatch
WORKDIR /root/.urlwatch

CMD ["crond", "-f", "-L", "/dev/stdout"]
