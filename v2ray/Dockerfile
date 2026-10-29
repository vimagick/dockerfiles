#
# Dockerfile from v2ray
#

FROM alpine:3.24
MAINTAINER EasyPi Software Foundation

ARG TARGETPLATFORM
ARG V2RAY_VERSION

ENV V2RAY_LOCATION_ASSET=/usr/local/share/v2ray
ENV V2RAY_LOCATION_CONFIG=/etc/v2ray

RUN set -xe \
 && V2RAY_ARCH=$(echo $TARGETPLATFORM | sed -e 's@linux/amd64@64@' \
                                            -e 's@linux/arm64@arm64-v8a@') \
 && V2RAY_URL=https://github.com/v2fly/v2ray-core/releases/download/v${V2RAY_VERSION}/v2ray-linux-${V2RAY_ARCH}.zip \
 && apk add --no-cache curl unzip \
 && curl -sSL ${V2RAY_URL} > v2ray.zip \
 && unzip -j v2ray.zip 'v2ray' -d /usr/local/bin \
 && unzip -j v2ray.zip '*.dat' -d $V2RAY_LOCATION_ASSET \
 && unzip -j v2ray.zip '*.json' -d $V2RAY_LOCATION_CONFIG \
 && rm v2ray.zip \
 && apk del curl unzip

CMD ["v2ray", "run"]
