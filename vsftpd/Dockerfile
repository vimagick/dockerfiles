#
# Dockerfile for vsftpd
#

FROM alpine
MAINTAINER kev <noreply@datageek.info>

RUN set -xe \
    && apk add -U vsftpd \
    && passwd -l root \
    && adduser -D virtual \
    && rm -rf /var/cache/apk/*

RUN { \
        echo 'allow_writeable_chroot=YES'; \
        echo 'anonymous_enable=YES'; \
        echo 'chroot_local_user=YES'; \
        echo 'connect_from_port_20=YES'; \
        echo 'dirmessage_enable=YES'; \
        echo 'ftpd_banner=Welcome to VSFTPD service.'; \
        echo 'listen=YES'; \
        echo 'local_enable=YES'; \
        echo 'no_anon_password=YES'; \
        echo 'pasv_addr_resolve=YES'; \
        echo 'pasv_address=datageek.info'; \
        echo 'pasv_enable=YES'; \
        echo 'pasv_max_port=30010'; \
        echo 'pasv_min_port=30000'; \
        echo 'port_enable=YES'; \
        echo 'seccomp_sandbox=NO'; \
        echo 'write_enable=YES'; \
        echo 'xferlog_enable=YES'; \
    } > /etc/vsftpd/vsftpd.conf

VOLUME /var/lib/ftp
WORKDIR /var/lib/ftp

EXPOSE 21

CMD ["vsftpd", "/etc/vsftpd/vsftpd.conf"]
