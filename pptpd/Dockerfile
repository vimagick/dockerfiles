#
# Dockerfile for pptpd
#

FROM alpine
MAINTAINER kev<noreply@datageek.info>

RUN apk update \
    && apk add iptables ppp pptpd \
    && rm -rf /var/cache/apk/*

COPY pptpd.conf    /etc/
COPY chap-secrets  /etc/ppp/
COPY pptpd-options /etc/ppp/

EXPOSE 1723

CMD iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE \
    && pptpd \
    && syslogd -n -O /dev/stdout
