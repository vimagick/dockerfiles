FROM ubuntu:14.04
MAINTAINER kev

RUN apt-get update
RUN apt-get install -y build-essential supervisor dnsmasq

ADD ./services.conf /etc/supervisor/conf.d/
ADD ./dnsmasq.conf /etc/
ADD https://download.libsodium.org/libsodium/releases/libsodium-1.0.2.tar.gz /tmp/
ADD http://download.dnscrypt.org/dnscrypt-proxy/dnscrypt-proxy-1.4.3.tar.gz /tmp/

WORKDIR /tmp

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

CMD supervisor -n -c /etc/supervisor/supervisord.conf
