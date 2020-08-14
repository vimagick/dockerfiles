#
# Dockerfile for snort-arm
#

FROM arm32v7/alpine:3
MAINTAINER EasyPi Software Foundation

RUN set -xe \
    && apk add --no-cache snort \
    && mkdir -p /usr/local/lib/snort_dynamicrules

COPY data /etc/snort

ENTRYPOINT ["snort"]
CMD ["--help"]
