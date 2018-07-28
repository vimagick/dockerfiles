#
# Dockerfile for rsyslog-arm
#

FROM easypi/alpine-arm
MAINTAINER EasyPi Software Foundation

RUN set -xe \
    && apk add --no-cache rsyslog \
    && sed -i '/imklog/s/^/#/' /etc/rsyslog.conf \
    && { \
        echo '###Syslog Server####'; \
        echo 'module(load="imtcp")'; \
        echo 'module(load="imudp")'; \
        echo 'input(type="imtcp" port="514")'; \
        echo 'input(type="imudp" port="514")'; \
    } >> /etc/rsyslog.conf

VOLUME /var/log
WORKDIR /var/log

ENV TZ=UTC

EXPOSE 514/tcp \
       514/udp

ENTRYPOINT ["rsyslogd", "-n"]
