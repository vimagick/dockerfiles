#
# Dockerfile for rsyslog-arm
#

FROM easypi/alpine-arm
MAINTAINER EasyPi Software Foundation

RUN apk add --no-cache rsyslog

COPY rsyslog.conf /etc/rsyslog.conf

VOLUME /var/log
WORKDIR /var/log

ENV TZ=UTC

EXPOSE 514/tcp \
       514/udp

ENTRYPOINT ["rsyslogd", "-n"]
