#
# Dockerfile for ProxyHub
#

FROM ubuntu:14.04
MAINTAINER kev <noreply@easypi.pro>

RUN apt-get update
RUN apt-get install -y build-essential pdnsd haproxy polipo nginx python
RUN apt-get clean

ADD ./haproxy.cfg /etc/haproxy/
ADD ./pdnsd.conf /etc/
ADD ./polipo.conf /etc/polipo/config
ADD ./shadowsocks.json /etc/
ADD ./supervisord.conf /etc/supervisor/
ADD ./services.ini /etc/supervisor/conf.d/

ADD http://stedolan.github.io/jq/download/linux64/jq /usr/local/bin/
ADD https://bootstrap.pypa.io/get-pip.py /tmp/pkgs/
ADD https://download.libsodium.org/libsodium/releases/libsodium-1.0.2.tar.gz /tmp/pkgs/
ADD http://download.dnscrypt.org/dnscrypt-proxy/dnscrypt-proxy-1.4.3.tar.gz /tmp/pkgs/

WORKDIR /tmp/pkgs/
RUN chmod +x /usr/local/bin/jq
RUN python get-pip.py
RUN pip install --no-cache-dir supervisor shadowsocks
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
EXPOSE 53/udp 53/tcp 80 1080 8123 9001

CMD supervisord -n -c /etc/supervisor/supervisord.conf
