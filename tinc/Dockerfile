#
# Dockerfile for tinc
#

FROM debian:jessie
MAINTAINER kev <noreply@datageek.inf>

ENV NETNAME netname
ENV PIDFILE /run/tinc.$NETNAME.pid
ENV VERBOSE 2
ENV ADDRESS 10.0.0.1
ENV NETMASK 255.255.255.0

RUN apt-get update \
    && apt-get install -y net-tools tinc \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /etc/tinc/$NETNAME/hosts

WORKDIR /etc/tinc/$NETNAME

RUN /bin/echo -e "Name=server\\nAddressFamily=ipv4\\nInterface=tun0" > tinc.conf \
    && /bin/echo -e "Subnet=$ADDRESS\\nSubnet=0.0.0.0/0" > hosts/server \
    && /bin/echo -e "\\n" | tincd -n $NETNAME -K4096 \
    && /bin/echo -e "ifconfig \$INTERFACE $ADDRESS netmask $NETMASK" > tinc-up \
    && /bin/echo -e "ifconfig \$INTERFACE down" > tinc-down \
    && chmod +x tinc-up tinc-down

VOLUME /etc/tinc
EXPOSE 655/udp

CMD tincd --no-detach \
          --net $NETNAME \
          --pidfile $PIDFILE \
          --debug $VERBOSE

