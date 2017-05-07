#
# Dockerfile for vsftpd
#

FROM alpine
MAINTAINER kev <noreply@easypi.pro>

RUN set -xe \
    && apk add -U build-base \
                  curl \
                  linux-pam-dev \
                  tar \
                  vsftpd \
    && mkdir pam_pwdfile \
        && cd pam_pwdfile \
        && curl -sSL https://github.com/tiwe-de/libpam-pwdfile/archive/v1.0.tar.gz | tar xz --strip 1 \
        && make install \
        && cd .. \
        && rm -rf pam_pwdfile \
    && apk del build-base \
               curl \
               linux-pam-dev \
               tar \
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
        echo 'pasv_address=easypi.info'; \
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
