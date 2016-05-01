#
# Dockerfile for building PhantomJS
#

FROM ubuntu:14.04
MAINTAINER kev <noreply@easypi.info>

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
    && git clone -b 2.1 --depth 1 --single-branch git://github.com/ariya/phantomjs.git \
    && cd phantomjs \
    && echo y | ./build.py 2>/dev/null 1>&2 \
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

CMD ["/usr/local/bin/phantomjs"]
