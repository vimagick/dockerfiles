#
# Dockerfile for vsftpd
#

FROM alpine
MAINTAINER kev <noreply@datageek.info>

RUN apk add -U vsftpd \
    && rm -rf /var/cache/apk/* \
    && echo "seccomp_sandbox=NO" >> /etc/vsftpd/vsftpd.conf

EXPOSE 21

CMD ["vsftpd", "/etc/vsftpd/vsftpd.conf"]
