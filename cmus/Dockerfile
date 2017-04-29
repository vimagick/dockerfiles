#
# Dockerfile for cmus
#

FROM alpine
MAINTAINER EasyPi Software Foundation

RUN apk add --no-cache cmus

VOLUME /etc/cmus
WORKDIR /etc/cmus

ENV CMUS_HOME=/etc/cmus
ENV CMUS_SOCKET=0.0.0.0:3000
ENV USERNAME=root
ENV PASSWORD=secret

EXPOSE 3000

CMD set -xe \
    && echo "set passwd=$PASSWORD" > rc \
    && cmus
