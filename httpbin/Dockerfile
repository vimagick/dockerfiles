#
# Dockerfile for httpbin
#

FROM alpine:3
MAINTAINER EasyPi Software Foundation

RUN set -xe \
 && apk add --no-cache py3-brotlipy py3-cffi py3-pip \
 && pip3 install --no-cache-dir gunicorn httpbin

EXPOSE 8000
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "httpbin:app"]
