#
# Dockerfile for httpbin
#

FROM alpine:3
MAINTAINER EasyPi Software Foundation

RUN set -xe \
 && apk add --no-cache build-base libffi-dev python3 python3-dev \
 && python3 -m ensurepip \
 && pip3 install --no-cache-dir gunicorn httpbin \
 && apk del build-base libffi-dev python3-dev

EXPOSE 8000
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "httpbin:app"]
