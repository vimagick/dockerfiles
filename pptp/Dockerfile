#
# Dockerfile for VPN (PPTP)
#

FROM ubuntu:14.04
MAINTAINER kev<noreply@datageek.info>

RUN apt-get update && \
    apt-get install -y iptables pptpd && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN echo "localip 10.99.99.1" >> /etc/pptpd.conf && \
    echo "remoteip 10.99.99.100-200" >> /etc/pptpd.conf && \
    echo "ms-dns 8.8.8.8" >> /etc/ppp/pptpd-options

EXPOSE 1723

CMD iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE && \
    pptpd --fg

