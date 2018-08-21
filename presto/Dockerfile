#
# Dockerfile for presto
#

FROM java:8-jre-alpine
MAINTAINER kev <noreply@easypi.pro>

ENV PRESTO_VERSION 0.208
ENV PRESTO_URL https://repo1.maven.org/maven2/com/facebook/presto/presto-server/$PRESTO_VERSION/presto-server-$PRESTO_VERSION.tar.gz
ENV PRESTO_HOME /opt/presto

WORKDIR $PRESTO_HOME

RUN set -xe \
    && apk add --no-cache curl python tar \
    && curl -sSL $PRESTO_URL | tar xz --strip 1 \
    && apk del curl tar

VOLUME /var/presto/data

EXPOSE 8080

ENTRYPOINT ["./bin/launcher"]
CMD ["run"]
