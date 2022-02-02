#
# Dockerfile for owncast-arm
#

FROM alpine:3
MAINTAINER EasyPi Software Foundation

ENV OWNCAST_VERSION=0.0.10
ENV OWNCAST_FILE=owncast-${OWNCAST_VERSION}-linux-arm64.zip
ENV OWNCAST_URL=https://github.com/owncast/owncast/releases/download/v${OWNCAST_VERSION}/${OWNCAST_FILE}

WORKDIR /app

RUN set -xe \
  && apk add --no-cache curl ffmpeg ffmpeg-libs gcompat \
  && curl -sSLO ${OWNCAST_URL} \
  && unzip ${OWNCAST_FILE} \
  && rm ${OWNCAST_FILE}

CMD ["/app/owncast"]
