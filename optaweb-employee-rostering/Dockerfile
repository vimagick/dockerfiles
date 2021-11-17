#
# Dockerfile for optaweb-employee-rostering
#

FROM openjdk:11-jdk-slim
MAINTAINER EasyPi Software Foundation

ENV APP_VERSION=8.13.0.Final
ENV APP_FILE=optaweb-employee-rostering-distribution-${APP_VERSION}.zip
ENV APP_URL=https://download.jboss.org/optaplanner/release/${APP_VERSION}/${APP_FILE}

RUN set -xe \
 && apt update -y \
 && apt install -y wget unzip \
 && cd /opt \
 && wget ${APP_URL} \
 && unzip ${APP_FILE} \
 && mv ${APP_FILE%.zip} app \
 && rm -rf ${APP_FILE} /var/lib/apt/lists/*

WORKDIR /opt/app
EXPOSE 8080
CMD /opt/app/bin/runLocally.sh
