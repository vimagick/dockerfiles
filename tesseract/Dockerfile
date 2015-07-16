#
# Dockerfile for tesseract
#

FROM debian:jessie
MAINTAINER kev <noreply@datageek.info>

RUN apt-get update \
    && apt-get install -y autoconf \
                          build-essential \
                          git \
                          leptonica \
                          leptonica-dev \
                          libtool \
    && git clone https://github.com/tesseract-ocr/tesseract.git \
    && cd tesseract \
    && ./autogen.sh \
    && ./configure \
    && make install \
    && cd .. \
    && rm -rf tesseract /var/cache/apk/* \
    && apt-get purge --auto-remove -y autoconf \
                                      build-essential \
                                      git \
                                      leptonica-dev \
                                      libtool

ENTRYPOINT ["tesseract"]
CMD ["-h"]

