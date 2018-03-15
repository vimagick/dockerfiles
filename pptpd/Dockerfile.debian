#
# Dockerfile for pptpd
#

FROM debian:jessie
MAINTAINER kev<noreply@easypi.pro>

RUN apt-get update \
    && apt-get install -y iptables pptpd \
    && rm -rf /var/lib/apt/lists/*

COPY ./data/pptpd.conf    /etc/
COPY ./data/chap-secrets  /etc/ppp/
COPY ./data/pptpd-options /etc/ppp/

EXPOSE 1723

CMD iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE \
    && pptpd --fg
