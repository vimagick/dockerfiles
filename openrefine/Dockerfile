#
# Dockerfile for openrefine
#

FROM openjdk:17-bullseye
MAINTAINER EasyPi Software Foundation

ARG OPENREFINE_VERSION=3.6.0
ARG OPENREFINE_URL=https://oss.sonatype.org/service/local/artifact/maven/content?r=releases&g=org.openrefine&a=openrefine&v=${OPENREFINE_VERSION}&c=linux&p=tar.gz

WORKDIR /app

RUN curl -sSL "${OPENREFINE_URL}" | tar xz --strip 1

VOLUME /data
WORKDIR /data

EXPOSE 3333

ENTRYPOINT ["/app/refine"]
