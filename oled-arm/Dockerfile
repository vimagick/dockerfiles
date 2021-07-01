#
# Dockerfile for oled-arm
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
    && pip install --no-cache-dir luma.oled \
    && apk del --purge build-base \
                       curl \
                       linux-headers \
                       python-dev \
                       freetype-dev \
                       jpeg-dev

WORKDIR /code

RUN set -xe \
    && apk add --no-cache curl tar \
    && curl -sSL https://github.com/rm-hull/luma.examples/archive/master.tar.gz | tar xz --strip 2  luma.examples-master/examples \
    && apk del --purge curl tar

ENTRYPOINT ["python"]
