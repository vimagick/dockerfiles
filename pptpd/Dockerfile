#
# Dockerfile for pptpd
#

FROM alpine
MAINTAINER kev<noreply@datageek.info>

RUN apk add -U iptables \
               ppp \
               pptpd \
    && rm -rf /var/cache/apk/*

RUN echo "username * password *"      >> /etc/ppp/chap-secrets \
    && echo "localip 10.10.10.1"      >> /etc/pptpd.conf \
    && echo "remoteip 10.10.10.2-254" >> /etc/pptpd.conf \
    && echo "ms-dns 8.8.8.8"          >> /etc/ppp/pptpd-options \
    && echo "ms-dns 8.8.4.4"          >> /etc/ppp/pptpd-options

EXPOSE 1723

CMD iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE \
    && pptpd --fg --logwtmp

