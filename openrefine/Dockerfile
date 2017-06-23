#
# Dockerfile for openrefine
#

FROM java:8-jre-alpine
MAINTAINER kev <noreply@easypi.pro>

ENV OR_VERSION 2.7
ENV OR_FILE openrefine-linux-${OR_VERSION}.tar.gz
ENV OR_URL https://github.com/OpenRefine/OpenRefine/releases/download/${OR_VERSION}/${OR_FILE}

WORKDIR /app

RUN set -xe \
    && apk add --no-cache bash curl jq tar \
    && curl -sSL ${OR_URL} | tar xz --strip 1

VOLUME /data
WORKDIR /data

EXPOSE 3333

ENTRYPOINT ["/app/refine"]
CMD ["-i", "0.0.0.0", "-d", "/data"]
