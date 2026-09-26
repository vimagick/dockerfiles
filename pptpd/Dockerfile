#
# Dockerfile for pptpd
#

FROM alpine:3.17
MAINTAINER EasyPi Software Foundation

RUN apk add --no-cache iptables ppp pptpd \
 && ln -sf /sbin/xtables-nft-multi /sbin/iptables \
 && ln -sf /sbin/xtables-nft-multi /sbin/iptables-save \
 && ln -sf /sbin/xtables-nft-multi /sbin/iptables-restore

EXPOSE 1723

CMD set -xe \
    && pptpd -c /etc/ppp/pptpd.conf \
    && syslogd -n -O /dev/stdout
