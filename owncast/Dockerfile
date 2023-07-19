#
# Dockerfile for owncast
#

FROM alpine:3
MAINTAINER EasyPi Software Foundation

ARG TARGETPLATFORM

ENV OWNCAST_VERSION=0.0.10

WORKDIR /app

RUN set -xe \
  && OWNCAST_ARCH=$(echo $TARGETPLATFORM | sed -e 's@^linux/@@' \
                                               -e 's@386@32bit@' \
                                               -e 's@amd64@64bit@' \
                                               -e 's@arm/v7@arm7@' \
                                               -e 's@arm64@arm64@') \
  && OWNCAST_FILE=owncast-${OWNCAST_VERSION}-linux-${OWNCAST_ARCH}.zip \
  && apk add --no-cache curl ffmpeg ffmpeg-libs gcompat \
  && curl -sSLO https://github.com/owncast/owncast/releases/download/v${OWNCAST_VERSION}/${OWNCAST_FILE} \
  && unzip ${OWNCAST_FILE} \
  && rm ${OWNCAST_FILE}

CMD ["/app/owncast"]
