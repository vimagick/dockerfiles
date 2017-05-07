#
# Dockerfile for tesseract
#

FROM debian:jessie
MAINTAINER kev <noreply@easypi.pro>

RUN set -xe \
    && apt-get update \
    && apt-get install -y autoconf \
                          build-essential \
                          git \
                          libcairo2 \
                          libcairo2-dev \
                          libgomp1 \
                          libicu52 \
                          libicu-dev \
                          liblept4 \
                          libleptonica-dev \
                          libpango1.0-0 \
                          libpango1.0-dev \
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
                                      libcairo2-dev \
                                      libicu-dev \
                                      libleptonica-dev \
                                      libpango1.0-dev \
                                      libtool \
    && rm -rf tesseract tessdata /var/cache/apk/*

ENTRYPOINT ["tesseract"]
CMD ["-h"]

