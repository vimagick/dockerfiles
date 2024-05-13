#
# Dockerfile from v2ray
#

FROM alpine:3
MAINTAINER EasyPi Software Foundation

ARG V2RAY_VERSION=5.16.1
ARG V2RAY_OS=linux
ARG V2RAY_ARCH=64
ARG V2RAY_FILE=v2ray-${V2RAY_OS}-${V2RAY_ARCH}.zip
ARG V2RAY_URL=https://github.com/v2fly/v2ray-core/releases/download/v${V2RAY_VERSION}/${V2RAY_FILE}

ENV V2RAY_LOCATION_ASSET=/usr/local/share/v2ray
ENV V2RAY_LOCATION_CONFIG=/etc/v2ray

RUN set -xe \
 && apk add --no-cache curl unzip \
 && curl -sSL ${V2RAY_URL} > v2ray.zip \
 && unzip -j v2ray.zip 'v2ray' -d /usr/local/bin \
 && unzip -j v2ray.zip '*.dat' -d $V2RAY_LOCATION_ASSET \
 && unzip -j v2ray.zip '*.json' -d $V2RAY_LOCATION_CONFIG \
 && rm v2ray.zip \
 && apk del curl unzip

EXPOSE 10086

CMD ["v2ray", "run"]
