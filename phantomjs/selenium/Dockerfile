#
# Dockerfile for selenium-node-phantomjs
#

FROM debian:jessie
MAINTAINER kev <noreply@easypi.info>

ENV PHANTOMJS_VER 2.1.1
ENV PHANTOMJS_URL https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-${PHANTOMJS_VER}-linux-x86_64.tar.bz2
ENV PHANTOMJS_BIN phantomjs-${PHANTOMJS_VER}-linux-x86_64/bin/phantomjs

RUN set -xe \
    && apt-get update \
    && apt-get install -y bzip2 curl libfontconfig \
    && curl -sSL ${PHANTOMJS_URL} | tar xj -C /usr/local/bin --strip 2 ${PHANTOMJS_BIN} \
    && apt-get remove -y bzip2 curl \
    && rm -rf /var/lib/apt/lists/*

ENV HOST 0.0.0.0
ENV PORT 5555
ENV HUB_HOST 127.0.0.1
ENV HUB_PORT 4444

CMD phantomjs --webdriver=$HOST:$PORT \
              --webdriver-selenium-grid-hub=http://$HUB_HOST:$HUB_PORT
