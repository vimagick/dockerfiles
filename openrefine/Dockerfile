#
# Dockerfile for openrefine
#

FROM java:8-jre-alpine
MAINTAINER kev <noreply@easypi.info>

ENV OR_VERSION 2.6-rc.2
ENV OR_FILE openrefine-linux-${OR_VERSION}.tar.gz
ENV OR_URL https://github.com/OpenRefine/OpenRefine/releases/download/${OR_VERSION}/${OR_FILE}

WORKDIR /app

RUN set -xe \
    && apk add -U bash curl tar \
    && curl -sSL ${OR_URL} | tar xz --strip 1 \
    && rm -rf /var/cache/apk/*

VOLUME /root/.local/share/openrefine

EXPOSE 3333

CMD /app/refine -i 0.0.0.0
