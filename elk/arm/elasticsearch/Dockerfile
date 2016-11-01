#
# Dockerfile for elasticsearch-arm
#

FROM easypi/alpine-arm:edge
MAINTAINER EasyPi Software Foundation

ENV ELASTICSEARCH_VERSION 5.0.0
ENV ELASTICSEARCH_URL https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-$ELASTICSEARCH_VERSION.tar.gz

ENV GOSU_VERSION 1.10
ENV GOSU_URL https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-armhf

WORKDIR /opt/elasticsearch

RUN set -xe \
    && apk add --no-cache ca-certificates \
                          bash \
                          curl \
                          openjdk8-jre \
                          tar \
    && curl -sSL $ELASTICSEARCH_URL | tar xz --strip 1 \
    && curl -sSL $GOSU_URL > /usr/local/bin/gosu \
    && chmod +x /usr/local/bin/gosu \
    && gosu nobody true \
    && apk del curl tar

RUN set -xe \
    && addgroup -g 1000 elasticsearch \
    && adduser -D -H -h /opt/elasticsearch -u 1000 -G elasticsearch elasticsearch \
    && mkdir -p data logs config/scripts \
    && chown -R elasticsearch:elasticsearch data logs config

COPY config ./config
COPY docker-entrypoint.sh /entrypoint.sh

VOLUME /opt/elasticsearch/data

EXPOSE 9200 9300

ENTRYPOINT ["/entrypoint.sh"]
CMD ["elasticsearch"]
