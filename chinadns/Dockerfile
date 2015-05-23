#
# Dockerfile for chinadns
#

FROM ubuntu:14.04
MAINTAINER kev <noreply@datageek.info>

ENV DNS_VER 1.3.1
ENV DNS_URL https://github.com/clowwindy/ChinaDNS/releases/download/${DNS_VER}/chinadns-${DNS_VER}.tar.gz
ENV DNS_DIR /tmp/chinadns
ENV DNS_FILE chinadns.tar.gz
ENV DNS_MD5 9e2aca1a265aec7ca87f4d0377d9fa74

RUN apt-get update \
    && apt-get install -y build-essential curl dnsmasq supervisor \
    && mkdir -p ${DNS_DIR} \
    && cd ${DNS_DIR} \
    && curl -sSL ${DNS_URL} -o ${DNS_FILE} \
    && echo "${DNS_MD5} ${DNS_FILE}" | md5sum -c \
    && tar xzf ${DNS_FILE} --strip 1 \
    && ./configure \
    && make \
    && make install \
    && cd .. \
    && rm -rf ${DNS_DIR}
    && apt-get remove -y build-essential \
    && apt-get autoremove \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

RUN curl http://ftp.apnic.net/apnic/stats/apnic/delegated-apnic-latest \
        | grep ipv4 \
            | grep CN \
                | awk -F\| '{printf("%s/%d\n", $4, 32-log($5)/log(2))}' > /etc/chnroute.txt

ADD ./services.conf /etc/supervisor/conf.d/

EXPOSE 53/tcp 53/udp

CMD supervisord -n -c /etc/supervisor/supervisord.conf
