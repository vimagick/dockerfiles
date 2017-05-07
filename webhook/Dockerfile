#
# Dockerfile for webhook
#

FROM alpine
MAINTAINER kev <noreply@easypi.pro>

RUN set -xe \
    && apk add -U bash \
                  coreutils \
                  curl \
                  jq \
    && rm -rf /var/cache/apk/*

COPY ./webhook /usr/local/bin/

WORKDIR /scripts
VOLUME /scripts

EXPOSE 9000

ENTRYPOINT ["webhook"]
CMD ["-help"]
