#
# Dockerfile for monit
#

FROM alpine
MAINTAINER kev <noreply@datageek.info>

RUN apk add -U monit \
    && rm -rf /var/cache/apk/*

COPY monit /etc/monit

VOLUME /etc/monit /var/lib/monit
EXPOSE 2812

CMD ["monit", "-I", "-c", "/etc/monit/monitrc"]
