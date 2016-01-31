#
# Dockerfile for vsftpd
#

FROM alpine
MAINTAINER kev <noreply@datageek.info>

RUN set -xe \
    && apk add -U vsftpd \
    && rm -rf /var/cache/apk/*

RUN { \
        echo "allow_writeable_chroot=YES"; \
        echo "chroot_local_user=YES"; \
        echo "ftpd_banner=Welcome to VSFTPD service."; \
        echo "local_enable=YES"; \
        echo "pasv_addr_resolve=YES"; \
        echo "pasv_address=my-ftp-server"; \
        echo "pasv_enable=YES"; \
        echo "pasv_max_port=30100"; \
        echo "pasv_min_port=30000"; \
        echo "port_enable=YES"; \
        echo "seccomp_sandbox=NO"; \
        echo "write_enable=YES"; \
    } >> /etc/vsftpd/vsftpd.conf

VOLUME /var/lib/ftp
WORKDIR /var/lib/ftp

EXPOSE 21

CMD ["vsftpd", "/etc/vsftpd/vsftpd.conf"]
