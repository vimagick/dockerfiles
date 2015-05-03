#
# Dockerfile for VPN (PPTP)
#

FROM debian:jessie
MAINTAINER kev<noreply@datageek.info>

RUN apt-get update && \
    apt-get install -y iptables pptpd && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN echo "localip 192.168.128.1" >> /etc/pptpd.conf && \
    echo "remoteip 192.168.128.100-200" >> /etc/pptpd.conf

EXPOSE 1723

CMD iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE && \
    pptpd --fg

