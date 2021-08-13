#
# Dockerfile for owncast-arm
#

FROM arm32v7/alpine:3
MAINTAINER EasyPi Software Foundation

ENV OWNCAST_VERSION=0.0.8
ENV OWNCAST_FILE=owncast-${OWNCAST_VERSION}-linux-arm7.zip
ENV OWNCAST_URL=https://github.com/owncast/owncast/releases/download/v${OWNCAST_VERSION}/${OWNCAST_FILE}

WORKDIR /app

RUN set -xe \
  && apk add --no-cache curl ffmpeg ffmpeg-libs \
  && ln -s /lib/libc.musl-armv7.so.1 /lib/ld-linux-armhf.so.3 \
  && curl -sSLO ${OWNCAST_URL} \
  && unzip ${OWNCAST_FILE} \
  && rm ${OWNCAST_FILE}

CMD ["/app/owncast"]
