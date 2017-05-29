#
# Dockerfile for oled
#

FROM easypi/alpine-arm
MAINTAINER EasyPi Software Foundation

RUN set -xe \
    && apk add --no-cache build-base \
                          curl \
                          linux-headers \
                          python \
                          python-dev \
                          freetype \
                          freetype-dev \
                          jpeg \
                          jpeg-dev \
    && curl https://bootstrap.pypa.io/get-pip.py | python \
    && pip install luma.oled \
    && apk del --purge build-base \
                       curl \
                       linux-headers \
                       python-dev \
                       freetype-dev \
                       jpeg-dev

ENTRYPOINT ["python"]
