#
# Dockerfile for cmus
#

FROM alpine:3
MAINTAINER EasyPi Software Foundation

RUN apk add --no-cache cmus

VOLUME /root/.config/cmus

ENV CMUS_HOME=/root/.config/cmus
ENV CMUS_SOCKET=0.0.0.0:3000

EXPOSE 3000

ENTRYPOINT cmus
