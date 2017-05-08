#
# Dockerfile for casperjs
#

FROM debian:jessie
MAINTAINER kev <noreply@easypi.pro>

ENV PHANTOM_VER 2.1.1
ENV PHANTOM_URL https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-${PHANTOM_VER}-linux-x86_64.tar.bz2
ENV PHANTOM_DIR /usr/local/bin

ENV CASPER_VER 1.1.4-1
ENV CASPER_URL https://github.com/casperjs/casperjs/archive/${CASPER_VER}.tar.gz
ENV CASPER_DIR /usr/local/casperjs

RUN set -xe \
    && apt-get update \
    && apt-get install -y bzip2 \
                          curl \
                          libfontconfig \
                          libicu52 \
                          libsqlite3-0 \
                          python \
    && curl -sSL $PHANTOM_URL | tar xj -C $PHANTOM_DIR --strip 2 --wildcards '*/bin/phantomjs' \
    && chmod +x /usr/local/bin/phantomjs \
    && mkdir -p $CASPER_DIR \
    && curl -sSL $CASPER_URL | tar xz --strip 1 -C $CASPER_DIR \
    && ln -sf $CASPER_DIR/bin/casperjs /usr/local/bin/ \
    && apt-get remove -y bzip2 \
                         curl \
    && rm -rf /var/lib/apt/lists/*

COPY ./sample.js /app/

VOLUME /app/
WORKDIR /app/

ENTRYPOINT ["casperjs"]
CMD ["--help"]
