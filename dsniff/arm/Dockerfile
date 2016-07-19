#
# Dockerfile for dsniff-arm
#

FROM easypi/alpine-arm

MAINTAINER EasyPi Software Foundation

RUN set -xe \
    && echo 'http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories \
    && apk add --no-cache bash coreutils dsniff tmux

CMD set -xe \
    && tmux new -d -x 800 -y 600 \
    && sleep infinity
