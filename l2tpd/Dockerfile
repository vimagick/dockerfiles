#
# Dockerfile for l2tpd
#
# - https://raymii.org/s/tutorials/IPSEC_L2TP_vpn_on_a_Raspberry_Pi_with_Arch_Linux.html
# - https://github.com/jlund/streisand/tree/master/playbooks/roles/l2tp-ipsec
# - https://wiki.openwrt.org/inbox/openswanxl2tpvpn
#

FROM alpine:3.24
MAINTAINER EasyPi Software Foundation

RUN set -xe \
 && apk add --no-cache libreswan xl2tpd ppp \
 && ipsec initnss \
 && mkdir -p /etc/ipsec

EXPOSE 500/udp 1701/udp 4500/udp

CMD ipsec pluto --config /etc/ipsec/ipsec.conf --secretsfile /etc/ipsec/ipsec.secrets \
 && sleep 5 \
 && ipsec status | grep -q vpnpsk \
 && sleep 5 \
 && mkdir -p /var/run/xl2tpd \
 && touch /var/run/xl2tpd/l2tp-control \
 && xl2tpd -D -c /etc/xl2tpd/xl2tpd.conf
