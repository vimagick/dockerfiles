#
# Dockerfile for cadvisor
#

FROM alpine
MAINTAINER kev <noreply@datageek.info>

RUN set -xe \
    && apk add --update ca-certificates device-mapper \
    && wget https://circle-artifacts.com/gh/andyshinn/alpine-pkg-glibc/8/artifacts/0/home/ubuntu/alpine-pkg-glibc/packages/x86_64/glibc-2.21-r2.apk \
    && wget https://circle-artifacts.com/gh/andyshinn/alpine-pkg-glibc/8/artifacts/0/home/ubuntu/alpine-pkg-glibc/packages/x86_64/glibc-bin-2.21-r2.apk \
    && apk add --allow-untrusted glibc-2.21-r2.apk glibc-bin-2.21-r2.apk \
    && apk add zfs-utils --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted \
    && /usr/glibc/usr/bin/ldconfig /lib /usr/glibc/usr/lib \
    && echo 'hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4' >> /etc/nsswitch.conf \
    && rm -rf /var/cache/apk/*

RUN set -xe \
    && wget https://github.com/google/cadvisor/releases/download/v0.20.5/cadvisor -O /usr/bin/cadvisor \
    && chmod +x /usr/bin/cadvisor

EXPOSE 8080

ENTRYPOINT ["/usr/bin/cadvisor", "-logtostderr"]
