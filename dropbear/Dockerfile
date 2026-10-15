#
# Dockerfile for dropbear
#

FROM alpine:3.24

WORKDIR /etc/dropbear

RUN set -xe \
 && apk add --no-cache dropbear \
 && dropbearkey -t rsa -s 2048 -f dropbear_rsa_host_key \
 && dropbearkey -t ecdsa -s 256 -f dropbear_ecdsa_host_key \
 && dropbearkey -t ed25519 -f dropbear_ed25519_host_key \
 && chmod 600 dropbear_*_host_key \
 && passwd -d root

EXPOSE 22

CMD ["dropbear", "-F", "-E", "-B", "-a", "-p", "22"]
