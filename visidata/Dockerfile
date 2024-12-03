#
# Dockerfile for visidata
#

FROM alpine:3
MAINTAINER EasyPi Software Foundation

RUN set -xe \
 && apk add --no-cache python3 py3-pip \
 && pip3 config set global.break-system-packages true \
 && pip3 install visidata \
 && visidata --version \
 && vd --version

ENTRYPOINT ["vd"]
