#
# Dockerfile for snort-arm
#

FROM easypi/alpine-arm
MAINTAINER EasyPi Software Foundation

RUN set -xe \
    && apk add --no-cache snort \
    && mkdir -p /usr/local/lib/snort_dynamicrules

COPY data /etc/snort

ENTRYPOINT ["snort"]
CMD ["--help"]
