#
# Dockerfile for ProxyHub
#

FROM ubuntu:14.04
MAINTAINER kev <noreply@datageek.info>

RUN apt-get update
RUN apt-get install -y build-essential pdnsd haproxy nginx
RUN apt-get clean

RUN curl -sSL https://bootstrap.pypa.io/get-pip.py | python
RUN pip install supervisor shadowsocks

ADD ./supervisord.conf /etc/supervisor/
ADD ./services.conf /etc/supervisor/conf.d/
ADD ./pdnsd.conf /etc/
ADD ./shadowsocks /etc/shadowsocks
ADD ./haproxy.cfg /etc/haproxy/

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
EXPOSE 80 1080

CMD supervisord -n -c /etc/supervisor/supervisord.conf
