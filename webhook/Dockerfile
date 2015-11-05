#
# Dockerfile for webhook
#

FROM alpine
MAINTAINER kev <noreply@datageek.info>

RUN apk add -U bash

COPY webhook /usr/local/bin

WORKDIR /scripts
VOLUME /scripts

EXPOSE 9000

ENTRYPOINT ["webhook"]
CMD ["-help"]
