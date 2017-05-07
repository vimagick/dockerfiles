#
# Dockerfile for vault
#

FROM alpine
MAINTAINER kev <noreply@easypi.pro>

ENV VAULT_VER 0.5.2
ENV VAULT_URL https://releases.hashicorp.com/vault/${VAULT_VER}/vault_${VAULT_VER}_linux_amd64.zip
ENV VAULT_MD5 7d0f546d19c8e7e1eb5f8856bfa4cc29
ENV VAULT_FILE vault.zip
ENV VAULT_ADDR https://127.0.0.1:8200

RUN set -xe \
    && apk add -U ca-certificates \
    && wget -O $VAULT_FILE $VAULT_URL \
    && echo "$VAULT_MD5  $VAULT_FILE" | md5sum -c \
    && unzip $VAULT_FILE -d /usr/bin/ \
    && chmod +x /usr/bin/vault \
    && apk del ca-certificates \
    && rm $VAULT_FILE /var/cache/apk/*

COPY vault /etc/vault

VOLUME /etc/vault /var/lib/vault

EXPOSE 8200

CMD ["vault", "server", "-config=/etc/vault/vault.hcl"]
