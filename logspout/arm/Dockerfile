#
# Dockerfile for logspout-arm
#

FROM easypi/alpine-arm
MAINTAINER EasyPi Software Foundation

ENV LOGSPOUT_VER 3.2.5
ENV LOGSPOUT_URL https://github.com/gliderlabs/logspout/archive/v${LOGSPOUT_VER}.tar.gz

RUN set -xe \
    && apk add --no-cache curl tar \
    && mkdir -p /src \
    && curl -sSL ${LOGSPOUT_URL} | tar xz --strip 1 -C /src \
    && cd /src \
    && ./build.sh "$(cat VERSION)" \
    && cd / \
    && rm -rf /src \
    && apk del curl tar

VOLUME /mnt/routes
EXPOSE 80
ENTRYPOINT ["/bin/logspout"]

ONBUILD COPY ./build.sh /src/build.sh
ONBUILD COPY ./modules.go /src/modules.go
ONBUILD RUN cd /src && chmod +x ./build.sh && sleep 1 && sync && ./build.sh "$(cat VERSION)-custom"
