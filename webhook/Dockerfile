#
# Dockerfile for webhook
#

FROM alpine:3
MAINTAINER EasyPi Software Foundation

ARG WEBHOOK_VERSION=2.8.1
ARG WEBHOOK_OS=linux
ARG WEBHOOK_ARCH=amd64
ARG WEBHOOK_FILE=webhook-$WEBHOOK_OS-$WEBHOOK_ARCH.tar.gz
ARG WEBHOOK_URL=https://github.com/adnanh/webhook/releases/download/$WEBHOOK_VERSION/$WEBHOOK_FILE

RUN set -xe \
 && apk add --no-cache \
            bash \
            bind-tools \
            ca-certificates \
            coreutils \
            curl \
            curlie \
            gawk \
            gcompat \
            grep \
            iputils-ping \
            jq \
            mosquitto-clients \
            openssh \
            sed \
            tar \
            wget \
            xsv \
 && curl -sSL $WEBHOOK_URL | tar xz -C /usr/local/bin ${WEBHOOK_FILE%.tar.gz}/webhook --strip 1 \
 && webhook -version

WORKDIR /etc/webhook
VOLUME /etc/webhook

EXPOSE 9000

ENTRYPOINT ["webhook"]
# See: https://github.com/adnanh/webhook/blob/master/docs/Webhook-Parameters.md
CMD ["-hooks=hooks.json", "-hooks=hooks.yaml", "-hotreload", "-port=9000", "-template", "-urlprefix=hooks"]
