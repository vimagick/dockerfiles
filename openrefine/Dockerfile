#
# Dockerfile for openrefine
#

FROM openjdk:8-jre-alpine
MAINTAINER EasyPi Software Foundation

ENV OPENREFINE_VERSION 3.4.1
ENV OPENREFINE_FILE openrefine-linux-${OPENREFINE_VERSION}.tar.gz
ENV OPENREFINE_URL https://github.com/OpenRefine/OpenRefine/releases/download/${OPENREFINE_VERSION}/${OPENREFINE_FILE}

WORKDIR /app

RUN set -xe \
    && apk add --no-cache bash curl tar \
    && curl -sSL ${OPENREFINE_URL} | tar xz --strip 1

VOLUME /data
WORKDIR /data

EXPOSE 3333

ENTRYPOINT ["/app/refine"]
CMD ["-i", "0.0.0.0", "-d", "/data"]
