#
# Dockerfile for alpaca
#

FROM alpine:3
MAINTAINER EasyPi Software Foundation

ARG ALPACA_VERSION=v2.0.9
ARG ALPACA_FILE=alpaca_${ALPACA_VERSION}_linux-amd64
ARG ALPACA_URL=https://github.com/samuong/alpaca/releases/download/$ALPACA_VERSION/$ALPACA_FILE

ADD $ALPACA_URL /usr/local/bin/alpaca

RUN set -xe \
 && apk add --no-cache gcompat \
 && chmod +x /usr/local/bin/alpaca \
 && alpaca -version

ENTRYPOINT ["alpaca", "-l", "0.0.0.0", "-p", "3128"]
