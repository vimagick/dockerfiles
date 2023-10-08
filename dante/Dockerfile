#
# Dockerfile for dante
#

FROM debian:bookworm
MAINTAINER EasyPi Software Foundation

ARG DANTE_VER=1.4.3
ARG DANTE_URL=https://www.inet.no/dante/files/dante-$DANTE_VER.tar.gz
ARG DANTE_SHA1=1e264ec532774324b5508ba5f2ad226d479b4977
ARG DANTE_FILE=dante.tar.gz
ARG DANTE_TEMP=dante
ARG DANTE_DEPS="build-essential curl"

RUN set -xe \
    && apt-get update \
    && apt-get install -y $DANTE_DEPS \
    && mkdir $DANTE_TEMP \
        && cd $DANTE_TEMP \
        && curl -sSL $DANTE_URL -o $DANTE_FILE \
        && echo "$DANTE_SHA1 *$DANTE_FILE" | sha1sum -c \
        && tar xzf $DANTE_FILE --strip 1 \
        && ./configure \
        && make install \
        && cd .. \
        && rm -rf $DANTE_TEMP \
    && apt-get purge -y --auto-remove $DANTE_DEPS \
    && rm -rf /var/lib/apt/lists/*

COPY data/sockd.conf /etc/dante/sockd.conf

ENV CFGFILE=/etc/dante/sockd.conf
ENV PIDFILE=/run/sockd.pid
ENV WORKERS=10

EXPOSE 1080

CMD sockd -f $CFGFILE -p $PIDFILE -N $WORKERS
