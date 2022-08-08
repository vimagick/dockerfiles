#
# Dockerfile for aria2
#

FROM alpine:3
MAINTAINER EasyPi Software Foundation

RUN apk add --no-cache aria2

COPY ./data/etc/aria2.conf /etc/aria2/

ENV DIR=/data
ENV PORT=6800
ENV TOKEN=00000000-0000-0000-0000-000000000000

WORKDIR $DIR
EXPOSE ${PORT}

CMD aria2c --conf-path=/etc/aria2/aria2.conf \
           --rpc-listen-port=${PORT} \
           --rpc-secret=${TOKEN} \
           --dir=${DIR}
