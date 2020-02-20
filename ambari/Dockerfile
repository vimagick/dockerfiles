#
# Dockerfile for ambari
#

FROM ubuntu:18.04
MAINTAINER EasyPi Software Foundation

ENV AMBARI_VERSION=2.7.5.0
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
