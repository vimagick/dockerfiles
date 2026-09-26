#
# Dockerfile for pptpd
#

FROM alpine:3.24
MAINTAINER EasyPi Software Foundation

RUN apk add --no-cache iptables ppp pptpd

EXPOSE 1723

CMD set -xe \
    && iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE \
    && pptpd -c /etc/ppp/pptpd.conf \
    && syslogd -n -O /dev/stdout
