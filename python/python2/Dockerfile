#
# Dockerfile for python2
#

FROM alpine
MAINTAINER kev <noreply@easypi.pro>

RUN set -xe \
    && apk add --no-cache curl python \
    && curl -sSL https://bootstrap.pypa.io/get-pip.py | python

CMD ["python"]
