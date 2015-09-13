#
# Dockerfile for casperjs
#

FROM debian:jessie
MAINTAINER kev <noreply@datageek.info>

ENV PHANTOM_URL https://github.com/vimagick/dockerfiles/raw/master/webkit/bin/phantomjs
ENV CASPER_URL https://github.com/n1k0/casperjs/archive/master.tar.gz
ENV CASPER_DIR /usr/local/lib/casperjs/

RUN apt-get update \
    && apt-get install -y curl \
                          libfontconfig \
                          libicu52 \
                          python \
    && curl -sSL $PHANTOM_URL -o /usr/local/bin/phantomjs \
    && chmod +x /usr/local/bin/phantomjs \
    && mkdir -p $CASPER_DIR \
    && curl -sSL $CASPER_URL | tar xz --strip 1 -C $CASPER_DIR \
    && sed -i '/Warning PhantomJS v2.0 not yet released/s@^@//@' $CASPER_DIR/bin/bootstrap.js \
    && ln -sf $CASPER_DIR/bin/casperjs /usr/local/bin/ \
    && rm -rf /var/lib/apt/lists/*

COPY ./libjpeg.so.8 /usr/lib/x86_64-linux-gnu/
COPY ./sample.js /app/

VOLUME /app/
WORKDIR /app/

ENTRYPOINT ["casperjs"]
CMD ["--help"]
