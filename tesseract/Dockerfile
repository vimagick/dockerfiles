#
# Dockerfile for tesseract
#

FROM alpine
MAINTAINER kev <noreply@datageek.info>

RUN apk add -U autoconf \
               automake \
               build-base \
               git \
               libtool \
    && git clone https://github.com/tesseract-ocr/tesseract.git \
    && cd tesseract \
    && wget http://nl.alpinelinux.org/alpine/edge/testing/x86_64/leptonica-1.72-r0.apk \
    && wget http://nl.alpinelinux.org/alpine/edge/testing/x86_64/leptonica-dev-1.72-r0.apk \
    && apk add leptonica-1.72-r0.apk leptonica-dev-1.72-r0.apk \
    && ./autogen.sh \
    && ./configure \
    && make install \
    && cd .. \
    && rm -rf tesseract /var/cache/apk/* \
    && apk del autoconf \
               automake \
               build-base \
               git \
               leptonica-dev \
               libtool

ENTRYPOINT ["tesseract"]
CMD ["-h"]

