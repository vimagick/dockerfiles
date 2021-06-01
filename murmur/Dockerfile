#
# Dockerfile for murmur
#

FROM alpine 
MAINTAINER kev <noreply@easypi.pro>

ENV MM_VERSION 1.3.4
ENV MM_FILE murmur-static_x86-${MM_VERSION}.tar.bz2
ENV MM_URL https://github.com/mumble-voip/mumble/releases/download/${MM_VERSION}/${MM_FILE}

WORKDIR /etc/murmur

RUN set -xe \
    && apk add --no-cache curl tar \
    && curl -sSL ${MM_URL} | tar xj --strip 1 \
    && mv murmur.x86 /usr/local/bin/murmur \
    && apk del curl tar

VOLUME /etc/murmur

EXPOSE 64738/tcp \
       64738/udp

CMD ["murmur", "-fg", "-ini", "/etc/murmur/murmur.ini"]
