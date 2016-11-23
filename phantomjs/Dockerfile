#
# Dockerfile for building PhantomJS
#

FROM ubuntu:14.04
MAINTAINER EasyPi Software Foundation

ENV PHANTOMJS_VERSION 2.1.1

RUN set -xe \
    && apt-get update \
    && apt-get install -y bison \
                          build-essential \
                          flex \
                          g++ \
                          git \
                          gperf \
                          libfontconfig1 \
                          libfontconfig1-dev \
                          libicu52 \
                          libicu-dev \
                          libjpeg8 \
                          libjpeg-dev \
                          libpng-dev \
                          libsqlite3-dev \
                          libssl-dev \
                          perl \
                          python \
                          ruby \
    && git clone git://github.com/ariya/phantomjs.git \
    && cd phantomjs \
    && git checkout $PHANTOMJS_VERSION \
    && git submodule init \
    && git submodule update \
    && sed -i '/platform:/s@^@//@' src/ghostdriver/hub_register.js \
    && echo y | ./build.py \
    && install -v -s -m 755 bin/phantomjs /usr/local/bin/ \
    && cd .. \
    && rm -rf phantomjs \
    && apt-get purge -y --auto-remove bison \
                                      build-essential \
                                      flex \
                                      g++ \
                                      git \
                                      gperf \
                                      libfontconfig1-dev \
                                      libicu-dev \
                                      libjpeg-dev \
                                      libpng-dev \
                                      libsqlite3-dev \
                                      libssl-dev \
                                      perl \
                                      python \
                                      ruby \
    && rm -rf /var/lib/apt/lists/*

CMD ["phantomjs"]
