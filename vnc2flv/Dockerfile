#
# Dockerfile for vnc2flv
#

FROM alpine
MAINTAINER kev <noreply@easypi.pro>

RUN set -xe \
    && apk add --no-cache build-base \
                          python \
                          python-dev \
                          py-pip \
    && pip install --no-cache-dir vnc2flv \
    && apk del --purge build-base \
                       python-dev \
                       py-pip

WORKDIR /data

ENTRYPOINT ["flvrec.py"]
CMD ["--help"]
