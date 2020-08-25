#
# Dockerfile for statsd
#

FROM alpine:3
MAINTAINER EasyPi Software Foundation

ENV STATSD_VERSION 0.8.6
ENV STATSD_URL https://github.com/etsy/statsd/archive/v$STATSD_VERSION.tar.gz

WORKDIR /opt/statsd

RUN set -xe \
    && apk add --no-cache ca-certificates curl nodejs nodejs-npm tar \
    && curl -sSL $STATSD_URL | tar xz --strip 1 \
    && npm install --production \
    && sed 's/graphite.example.com/graphite/' exampleConfig.js > config.js \
    && apk del curl tar

EXPOSE 8125/udp
EXPOSE 8126/tcp

CMD ["node", "stats.js", "config.js"]
