#
# Dockerfile for chinadns
#

FROM ubuntu:14.04
MAINTAINER kev <noreply@datageek.info>

RUN apt-get update
RUN apt-get install -y build-essential supervisor dnsmasq
RUN apt-get clean

ADD ./services.conf /etc/supervisor/conf.d/
ADD ./dnsmasq.conf /etc/
ADD https://github.com/clowwindy/ChinaDNS/releases/download/1.3.0/chinadns-1.3.0.tar.gz /tmp/pkgs/
ADD http://ftp.apnic.net/apnic/stats/apnic/delegated-apnic-latest /tmp/pkgs/

WORKDIR /tmp/pkgs/

RUN tar xzf chinadns-1.3.0.tar.gz && \
    cd chinadns-1.3.0 && \
    ./configure && \
    make && \
    make install

RUN cat delegated-apnic-latest | grep ipv4 | grep CN | \
    awk -F\| '{ printf("%s/%d\n", $4, 32-log($5)/log(2)) }' > /etc/chnroute.txt

WORKDIR /
RUN rm -r /tmp/pkgs/
EXPOSE 53 53/udp

CMD supervisord -n -c /etc/supervisor/supervisord.conf
