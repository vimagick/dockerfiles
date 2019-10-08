#
# Dockerfile for apacheds
#

FROM debian:buster
MAINTAINER EasyPi Software Foundation

ENV GOSU_VERSION=1.11
ENV GOSU_URL=https://github.com/tianon/gosu/releases/download/${GOSU_VERSION}/gosu-amd64

ENV APACHEDS_VERSION=2.0.0.AM25
ENV APACHEDS_FILE=apacheds-${APACHEDS_VERSION}-amd64.deb
ENV APACHEDS_URL=http://mirrors.advancedhosters.com/apache/directory/apacheds/dist/${APACHEDS_VERSION}/${APACHEDS_FILE}
ENV APACHEDS_USER=apacheds
ENV APACHEDS_GROUP=apacheds
ENV APACHEDS_DATA=/var/lib/apacheds
ENV APACHEDS_INSTANCE=default
ENV APACHEDS_INSTANCE_DIR=${APACHEDS_DATA}/${APACHEDS_INSTANCE}

RUN set -xe \
    && apt update \
    && apt install -y \
           apt-utils \
           curl \
           ldap-utils \
           openjdk-11-jre-headless \
           procps \
    && curl -sSL ${GOSU_URL} > /usr/local/bin/gosu \
    && chmod +x /usr/local/bin/gosu \
    && gosu nobody true \
    && curl -sSL ${APACHEDS_URL} > ${APACHEDS_FILE} \
    && dpkg -i ${APACHEDS_FILE} \
    && sed -i "/INSTANCES_DIRECTORY/s/-${APACHEDS_VERSION}//" /opt/apacheds-${APACHEDS_VERSION}/bin/apacheds \
    && rm -rf ${APACHEDS_FILE} /var/lib/apt/lists/*

EXPOSE 10389 10636

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]
