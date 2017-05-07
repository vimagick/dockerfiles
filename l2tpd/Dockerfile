#
# Dockerfile for l2tpd
#
# - https://raymii.org/s/tutorials/IPSEC_L2TP_vpn_on_a_Raspberry_Pi_with_Arch_Linux.html
# - https://github.com/jlund/streisand/tree/master/playbooks/roles/l2tp-ipsec
# - https://wiki.openwrt.org/inbox/openswanxl2tpvpn
#

FROM alpine:edge
MAINTAINER kev <noreply@easypi.pro>

RUN echo 'http://dl-4.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories \
    && apk add -U libreswan xl2tpd ppp \
    && ipsec initnss \
    && rm -rf /var/cache/apk/*

COPY ipsec.conf /etc/ipsec.conf
COPY ipsec.secrets /etc/ipsec.secrets
COPY options.xl2tpd /etc/ppp/options.xl2tpd
COPY chap-secrets /etc/ppp/chap-secrets

EXPOSE 500/udp 1701/udp 4500/udp

CMD iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE \
    && ipsec _stackmanager start \
    && ipsec pluto \
    && xl2tpd -D

