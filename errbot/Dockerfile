#
# Dockerfile for errbot
#

FROM alpine
MAINTAINER kev <noreply@easypi.info>

RUN set -xe \
    && apk add --no-cache ca-certificates \
                          build-base \
                          git \
                          libffi-dev \
                          openssl-dev \
                          python3 \
                          python3-dev \
    && pip3 install errbot \
                    hypchat \
                    irc \
                    pyasn1 \
                    pyasn1-modules \
                    python-telegram-bot \
                    slackclient \
                    sleekxmpp \
    && adduser -s /bin/sh -D errbot \
    && cd /home/errbot \
    && wget http://errbot.io/en/latest/_downloads/config-template.py \
    && apk del --purge build-base \
                       libffi-dev \
                       openssl-dev \
                       python3-dev

USER errbot
WORKDIR /home/errbot
RUN errbot --init
VOLUME /home/errbot

ENTRYPOINT ["errbot"]
