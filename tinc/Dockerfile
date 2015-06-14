#
# Dockerfile for tinc
#

FROM debian:jessie
MAINTAINER kev <noreply@datageek.inf>

ENV NETNAME netname

RUN apt-get update \
    && apt-get install -y net-tools tinc \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /etc/tinc/$NETNAME/hosts

WORKDIR /etc/tinc/$NETNAME

RUN /bin/echo -e 'Name=server\nAddressFamily=ipv4\nInterface=tun0' > tinc.conf \
    && /bin/echo -e 'Subnet=10.0.0.1\nSubnet=0.0.0.0/0' > hosts/server \
    && /bin/echo -e '\n' | tincd -n $NETNAME -K4096 \
    && /bin/echo -e 'ifconfig $INTERFACE 10.0.0.1 netmask 255.255.255.0' > tinc-up \
    && /bin/echo -e 'ifconfig $INTERFACE down' > tinc-down \
    && chmod +x tinc-up tinc-down

VOLUME /etc/tinc
EXPOSE 655/udp

CMD tincd --no-detach \
          --debug 3 \
          --net $NETNAME \
          --pidfile /run/tinc.$NETNAME.pid 
