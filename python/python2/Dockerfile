#
# Dockerfile for python2
#

FROM alpine
MAINTAINER kev <noreply@easypi.info>

RUN set -xe \
    && apk add -U curl python \
    && curl -sSL https://bootstrap.pypa.io/get-pip.py | python \
    && rm -rf /var/cache/apk/*

CMD ["python"]
