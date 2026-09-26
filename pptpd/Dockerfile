#
# Dockerfile for pptpd
#

FROM alpine:3.16
MAINTAINER EasyPi Software Foundation

RUN apk add --no-cache iptables ppp pptpd

EXPOSE 1723

CMD set -xe \
    && pptpd -c /etc/ppp/pptpd.conf \
    && syslogd -n -O /dev/stdout
