#
# Dockerfile for dnscrypt
#

FROM ubuntu:14.04
MAINTAINER kev <noreply@datageek.info>

RUN apt-get update
RUN apt-get install -y build-essential supervisor dnsmasq
RUN apt-get clean

ADD ./services.conf /etc/supervisor/conf.d/
ADD ./dnsmasq.conf /etc/
ADD https://download.libsodium.org/libsodium/releases/libsodium-1.0.2.tar.gz /tmp/pkgs/
ADD http://download.dnscrypt.org/dnscrypt-proxy/dnscrypt-proxy-1.4.3.tar.gz /tmp/pkgs/

WORKDIR /tmp/pkgs/

RUN tar xzf libsodium-1.0.2.tar.gz && \
    cd libsodium-1.0.2 && \
    ./configure && \
    make && \
    make install

RUN echo /usr/local/lib > /etc/ld.so.conf.d/local.conf && ldconfig

RUN tar xzf dnscrypt-proxy-1.4.3.tar.gz && \
    cd dnscrypt-proxy-1.4.3 && \
    ./configure && \
    make && \
    make install

WORKDIR /
RUN rm -r /tmp/pkgs/
EXPOSE 53 53/udp

CMD supervisord -n -c /etc/supervisor/supervisord.conf
