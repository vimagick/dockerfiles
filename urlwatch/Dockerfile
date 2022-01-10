#
# Dockerfile for urlwatch
#

FROM alpine:3
MAINTAINER EasyPi Software Foundation

RUN set -xe \
    && apk add --no-cache ca-certificates \
                          bash            \
                          build-base      \
                          curl            \
                          jq              \
                          libffi-dev      \
                          libxml2         \
                          libxml2-dev     \
                          libxslt         \
                          libxslt-dev     \
                          openssl-dev     \
                          python3         \
                          python3-dev     \
    && curl -sSL https://bootstrap.pypa.io/get-pip.py | python3 \
    && pip3 install --no-binary lxml           \
                                aioxmpp        \
                                appdirs        \
                                beautifulsoup4 \
                                chump          \
                                cssbeautifier  \
                                cssselect      \
                                jsbeautifier   \
                                keyring        \
                                keyrings.alt   \
                                lxml           \
                                markdown2      \
                                matrix_client  \
                                minidb         \
                                pushbullet.py  \
                                pyppeteer      \
                                pyyaml         \
                                requests       \
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
