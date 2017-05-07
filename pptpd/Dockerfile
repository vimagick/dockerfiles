#
# Dockerfile for pptpd
#

FROM alpine
MAINTAINER kev <noreply@easypi.pro>

RUN apk add --no-cache iptables ppp pptpd

COPY pptpd.conf    /etc/
COPY chap-secrets  /etc/ppp/
COPY pptpd-options /etc/ppp/

EXPOSE 1723

CMD set -xe \
    && iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE \
    && pptpd \
    && syslogd -n -O /dev/stdout
