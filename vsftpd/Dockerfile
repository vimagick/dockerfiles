#
# Dockerfile for vsftpd
#

FROM alpine
MAINTAINER kev <noreply@datageek.info>

RUN apk add -U vsftpd \
    && rm -rf /var/cache/apk/*

EXPOSE 21
USER vsftp

CMD ["vsftpd"]
