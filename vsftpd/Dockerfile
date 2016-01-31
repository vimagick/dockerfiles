#
# Dockerfile for vsftpd
#

FROM alpine
MAINTAINER kev <noreply@datageek.info>

RUN set -xe \
    && apk add -U vsftpd \
    && rm -rf /var/cache/apk/*

RUN { \
        echo "ftpd_banner=Welcome to VSFTPD service."; \
        echo "write_enable=YES"; \
        echo "local_enable=YES"; \
        echo "chroot_local_user=YES"; \
        echo "allow_writeable_chroot=YES"; \
        echo "seccomp_sandbox=NO"; \
    } >> /etc/vsftpd/vsftpd.conf

VOLUME /var/lib/ftp
WORKDIR /var/lib/ftp

EXPOSE 21

CMD ["vsftpd", "/etc/vsftpd/vsftpd.conf"]
