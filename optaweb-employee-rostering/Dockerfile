FROM maven:3-jdk-8-slim AS builder
MAINTAINER EasyPi Software Foundation

ENV APP_VERSION=7.45.0.Final
ENV APP_URL=https://github.com/kiegroup/optaweb-employee-rostering/archive/${APP_VERSION}.tar.gz

WORKDIR /opt/app

RUN set -xe \
    && curl -sSL ${APP_URL} | tar xz --strip 1 \
    && mvn clean install -DskipTests -DskipITs

#
# Dockerfile for optaweb-employee-rostering
#

FROM openjdk:8-alpine
MAINTAINER EasyPi Software Foundation

ENV APP_VERSION=7.45.0.Final

WORKDIR /opt/app

COPY --from=builder /opt/app/employee-rostering-distribution/target/employee-rostering-distribution-${APP_VERSION}.jar .

EXPOSE 8080

CMD java -jar employee-rostering-distribution-${APP_VERSION}.jar \
         --spring.datasource.url=jdbc:postgresql://${POSTGRES_HOST:-postgres}:${POSTGRES_PORT:-5432}/${POSTGRES_DB:-optaweb} \
         --spring.datasource.username=${POSTGRES_USER:-optaweb} \
         --spring.datasource.password=${POSTGRES_PASSWORD:-optaweb} \
         --server.port=8080
