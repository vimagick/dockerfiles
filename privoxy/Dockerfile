#
# Dockerfile for privoxy
#

FROM alpine
MAINTAINER kev <noreply@datageek.info>

ADD https://github.com/tianon/gosu/releases/download/1.4/gosu-amd64 /usr/sbin/gosu

RUN apk add -U iptables privoxy \
    && chmod +x /usr/sbin/gosu \
    && rm -rf /var/cache/apk/*

RUN sed -i -e '/^listen-address/s/127.0.0.1/0.0.0.0/' \
           -e '/^accept-intercepted-requests/s/0/1/' \
           -e '/^enforce-blocks/s/0/1/' \
           -e '/^#debug/s/#//' /etc/privoxy/config

VOLUME /etc/privoxy
EXPOSE 8118

CMD echo "{+block}" >> /etc/privoxy/user.action \
    && ip a s eth0 | grep -w inet | awk '{print $2}' | cut -d/ -f1 >> /etc/privoxy/user.action \
    && ip r s | grep default | awk '{print $3}' >> /etc/privoxy/user.action \
    && iptables -t filter -P OUTPUT DROP \
    && iptables -t filter -A OUTPUT -p udp --dport 53 -j ACCEPT \
    && iptables -t filter -A OUTPUT -p tcp \
                -m multiport --dports 53,80,443,8118 \
                -j ACCEPT \
    && iptables -t filter -A OUTPUT -p tcp \
                -m state --state ESTABLISHED,RELATED \
                -j ACCEPT \
    && iptables -t filter -A OUTPUT -p udp \
                -m state --state ESTABLISHED,RELATED \
                -j ACCEPT \
    && iptables -t filter -A OUTPUT -p tcp \
                -m owner --uid-owner privoxy \
                -j ACCEPT \
    && iptables -t nat -A OUTPUT -p tcp --dport 80 \
                -m owner ! --uid-owner privoxy \
                -j REDIRECT --to-ports 8118 \
    && gosu privoxy privoxy --no-daemon /etc/privoxy/config
