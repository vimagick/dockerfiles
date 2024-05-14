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
                          py3-pip \
                          python3 \
                          python3-dev \
    && rm -f /usr/lib/python3.11/EXTERNALLY-MANAGED \
    && pip3 install --no-cache-dir 'errbot[slack,discord,mattermost,IRC,telegram,XMPP]' \
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
