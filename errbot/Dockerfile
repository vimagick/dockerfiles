#
# Dockerfile for errbot
#

FROM alpine:3.19
MAINTAINER EasyPi Software Foundation

RUN set -xe \
    && apk add --no-cache ca-certificates \
                          build-base \
                          git \
                          libffi-dev \
                          openssl \
                          openssl-dev \
                          python3 \
                          python3-dev \
    && pip3 install --no-cache-dir -U pip \
    && pip3 install --no-cache-dir errbot \
                                   hypchat \
                                   irc \
                                   pyasn1 \
                                   pyasn1-modules \
                                   python-telegram-bot \
                                   slackclient \
                                   sleekxmpp \
    && adduser -s /bin/sh -h /opt/errbot -D errbot \
    && apk del --purge build-base \
                       libffi-dev \
                       openssl-dev \
                       python3-dev

USER errbot
WORKDIR /opt/errbot

RUN set -xe \
    && mkdir -p ~/.local/lib/python3.11/site-packages \
    && errbot --init

VOLUME /opt/errbot

ENTRYPOINT ["errbot"]
