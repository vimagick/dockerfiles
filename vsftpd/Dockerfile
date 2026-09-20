#
# Dockerfile for vsftpd
#

FROM alpine:3.24
MAINTAINER EasyPi Software Foundation

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
        && ln -sf /lib/security/pam_pwdfile.so /usr/lib/security/pam_pwdfile.so \
        && cd .. \
        && rm -rf pam_pwdfile \
    && apk del build-base \
               curl \
               linux-pam-dev \
               tar \
    && passwd -l root \
    && adduser -D virtual \
    && mkdir -m 755 -p /var/lib/ftp /var/log/vsftpd \
    && rm -rf /var/cache/apk/*

EXPOSE 21

CMD ["vsftpd", "/etc/vsftpd/vsftpd.conf"]
