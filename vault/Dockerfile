#
# Dockerfile for vault
#

FROM alpine
MAINTAINER kev <noreply@easypi.pro>

ENV VAULT_VER=0.9.0
ENV VAULT_URL=https://releases.hashicorp.com/vault/${VAULT_VER}/vault_${VAULT_VER}_linux_amd64.zip
ENV VAULT_MD5=6db0a01b144c73b0633bbcd69175cd2c

RUN set -xe \
    && apk add -U ca-certificates \
    && wget -O vault.zip $VAULT_URL \
    && echo "$VAULT_MD5  vault.zip" | md5sum -c \
    && unzip vault.zip -d /usr/bin/ \
    && chmod +x /usr/bin/vault \
    && apk del ca-certificates \
    && rm vault.zip /var/cache/apk/*

COPY ./data/etc /etc/vault
VOLUME /etc/vault /var/lib/vault /var/log/vault

EXPOSE 8200

ENV VAULT_ADDR=https://127.0.0.1:8200
ENV VAULT_SKIP_VERIFY=1

ENTRYPOINT ["vault"]
CMD ["server", "-config=/etc/vault/vault.hcl"]
