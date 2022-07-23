#
# Dockerfile for openrefine
#

FROM openjdk:17-bullseye
MAINTAINER EasyPi Software Foundation

ARG OPENREFINE_VERSION=3.6.0
ARG OPENREFINE_URL=https://oss.sonatype.org/service/local/artifact/maven/content?r=releases&g=org.openrefine&a=openrefine&v=${OPENREFINE_VERSION}&c=linux&p=tar.gz

RUN mkdir -p /app && cd /app \
 && curl -sSL "${OPENREFINE_URL}" | tar xz --strip 1

ENV REFINE_INTERFACE=0.0.0.0
ENV REFINE_PORT=3333
ENV REFINE_DATA_DIR=/data
ENV REFINE_MIN_MEMORY=256M
ENV REFINE_MEMORY=1024M

VOLUME $REFINE_DATA_DIR
WORKDIR $REFINE_DATA_DIR
EXPOSE $REFINE_PORT

ENTRYPOINT ["/app/refine"]
