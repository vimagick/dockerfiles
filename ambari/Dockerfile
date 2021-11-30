#
# Dockerfile for ambari
#

FROM ubuntu:18.04 AS build

ENV AMBARI_VERSION=2.7.6
ENV AMBARI_BUILD_NUMBER=388e072381e71c7755673b7743531c03a4d61be8

SHELL ["/bin/bash", "-c"]

RUN set -xe \
    && apt-get update \
    && apt-get install -y python maven node npm wget \
    && npm install --global yarn \
    && wget https://www-eu.apache.org/dist/ambari/ambari-$AMBARI_VERSION/apache-ambari-$AMBARI_VERSION-src.tar.gz \
    && tar xfvz apache-ambari-$AMBARI_VERSION-src.tar.gz \
    && cd apache-ambari-$AMBARI_VERSION-src \
    && mvn versions:set -DnewVersion=$AMBARI_VERSION.0.0 \
    && pushd ambari-metrics \
    && mvn versions:set -DnewVersion=$AMBARI_VERSION.0.0 \
    && popd \
    && mvn -B clean install jdeb:jdeb -DnewVersion=$AMBARI_VERSION.0.0 -DbuildNumber=$AMBARI_BUILD_NUMBER -DskipTests -Dpython.ver="python >= 2.6" \
    && find . -name '*.deb'

# TODO

FROM ubuntu:18.04
MAINTAINER EasyPi Software Foundation

ENV AMBARI_VERSION=2.7.6.0
ENV AMBARI_SOURCE=http://public-repo-1.hortonworks.com/ambari/ubuntu18/2.x/updates/${AMBARI_VERSION}/ambari.list
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

RUN set -xe \
    && apt-get update \
    && apt-get install -y curl gnupg libpostgresql-jdbc-java openjdk-8-jdk openssh-client \
    && curl -sSL ${AMBARI_SOURCE} > /etc/apt/sources.list.d/ambari.list \
    && apt-key adv --recv-keys --keyserver keyserver.ubuntu.com B9733A7A07513CAD \
    && apt-get update \
    && apt-get install -y ambari-server \
    && ambari-server setup --jdbc-db=postgres --jdbc-driver=/usr/share/java/postgresql.jar \
    && rm -rf /var/lib/apt/lists/*

VOLUME /etc/ambari-server/conf

EXPOSE 8080

CMD set -ex \
    && ambari-server start \
    && sleep 5 \
    && tail --pid=$(cat /var/run/ambari-server/ambari-server.pid) -f /var/log/ambari-server/ambari-server.log
