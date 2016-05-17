#
# Dockerfile for tesseract
#

FROM debian:jessie
MAINTAINER kev <noreply@easypi.info>

RUN set -xe \
    && apt-get update \
    && apt-get install -y autoconf \
                          build-essential \
                          git \
                          liblept4 \
                          libleptonica-dev \
                          libgomp1 \
                          libtool \
    && git clone https://github.com/tesseract-ocr/tesseract.git \
        && cd tesseract \
        && ./autogen.sh \
        && ./configure \
        && make install \
        && cd .. \
    && git clone https://github.com/tesseract-ocr/tessdata.git \
        && cd tessdata \
        && mv * /usr/local/share/tessdata/ \
        && cd .. \
    && apt-get purge --auto-remove -y autoconf \
                                      build-essential \
                                      git \
                                      libleptonica-dev \
                                      libtool \
    && rm -rf tesseract tessdata /var/cache/apk/*

ENTRYPOINT ["tesseract"]
CMD ["-h"]

