#
# Dockerfile for errbot
#

FROM alpine
MAINTAINER kev <noreply@easypi.pro>

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
    && adduser -s /bin/sh -D errbot \
    && apk del --purge build-base \
                       libffi-dev \
                       openssl-dev \
                       python3-dev

USER errbot
WORKDIR /home/errbot

RUN set -xe \
    && mkdir -p ~/.local/lib/python3.5/site-packages \
    && errbot --init

VOLUME /home/errbot

ENTRYPOINT ["errbot"]
