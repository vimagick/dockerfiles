#
# Dockerfile for presto-server
#

FROM java:8-jre-alpine
MAINTAINER kev <noreply@easypi.pro>

ENV PRESTO_VERSION 0.217
ENV PRESTO_URL https://repo1.maven.org/maven2/com/facebook/presto/presto-server/$PRESTO_VERSION/presto-server-$PRESTO_VERSION.tar.gz
ENV PRESTO_HOME /opt/presto-server

WORKDIR $PRESTO_HOME

RUN set -xe \
    && apk add --no-cache curl python tar \
    && curl -sSL $PRESTO_URL | tar xz --strip 1 \
    && apk del curl tar

VOLUME /data

EXPOSE 8080

ENTRYPOINT ["./bin/launcher"]
CMD ["run"]
