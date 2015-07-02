#
# Dockerfile for monit
#

FROM alpine
MAINTAINER kev <noreply@datageek.info>

RUN apk add -U monit \
    && rm -rf /var/cache/apk/*
    && mkdir -p /var/lib/monit/events

COPY monit /etc/monit

RUN chmod 600 /etc/monit/monitrc \
    && ln -sf /etc/monit/monitrc /etc/monitrc

VOLUME /etc/monit /var/lib/monit

EXPOSE 2812

CMD ["monit", "-Ic", "/etc/monitrc"]
