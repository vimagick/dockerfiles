#
# Dockerfile for pptpd
#

FROM alpine
MAINTAINER kev<noreply@datageek.info>

RUN apk add -U iptables ppp pptpd \
    && rm -rf /var/cache/apk/*

COPY pptpd.conf   /etc/
COPY chap-secrets /etc/ppp/
COPY options.pptp /etc/ppp/

EXPOSE 1723

CMD iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE \
    && syslogd \
    && pptpd \
    && tail -f /var/log/messages

