#
# Dockerfile for cadvisor
#

FROM alpine:edge
MAINTAINER kev <noreply@easypi.info>

RUN set -xe \
    && apk add --update ca-certificates openssl device-mapper zfs \
    && wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.23-r3/glibc-2.23-r3.apk \
    && wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.23-r3/glibc-bin-2.23-r3.apk \
    && apk add --allow-untrusted glibc-2.23-r3.apk glibc-bin-2.23-r3.apk \
    && /usr/glibc/usr/bin/ldconfig /lib /usr/glibc/usr/lib \
    && echo 'hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4' >> /etc/nsswitch.conf \
    && rm -rf /var/cache/apk/*

RUN set -xe \
    && wget https://github.com/google/cadvisor/releases/download/v0.23.6/cadvisor -O /usr/bin/cadvisor \
    && chmod +x /usr/bin/cadvisor

EXPOSE 8080

ENTRYPOINT ["/usr/bin/cadvisor", "-logtostderr"]
