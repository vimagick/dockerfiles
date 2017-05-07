#
# Dockerfile for iptables
#

FROM alpine
MAINTAINER kev <noreply@easypi.pro>

RUN apk add -U iproute2 && ln -s /usr/lib/tc /lib/tc

ENV LIMIT_PORT 8388
ENV LIMIT_CONN 5
ENV TCP_PORTS 80,443
ENV UDP_PORTS 53
ENV RATE 1mbit
ENV BURST 1kb
ENV LATENCY 50ms
ENV INTERVAL 60

CMD iptables -F \
    && iptables -A INPUT -p tcp -m state --state NEW --dport $LIMIT_PORT -m connlimit --connlimit-above $LIMIT_CONN -j DROP \
    && iptables -A OUTPUT -p tcp -m state --state NEW -m multiport ! --dports $TCP_PORTS -j DROP \
    && iptables -A OUTPUT -p udp -m state --state NEW -m multiport ! --dports $UDP_PORTS -j DROP \
    && tc qdisc add dev eth0 root tbf rate $RATE burst $BURST latency $LATENCY \
    && watch -n $INTERVAL tc -s qdisc ls dev eth0
