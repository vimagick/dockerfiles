#
# Dockerfile for privoxy
#

FROM alpine
MAINTAINER kev <noreply@datageek.info>

RUN apk add -U privoxy \
    && rm -rf /var/cache/apk/*

VOLUME /etc/privoxy
EXPOSE 8118

CMD ["privoxy", "--no-daemon", "/etc/privoxy/config"]
