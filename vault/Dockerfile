#
# Dockerfile for vault
#

FROM alpine
MAINTAINER kev <noreply@datageek.info>

ENV VAULT_VER 0.2.0
ENV VAULT_URL http://dl.bintray.com/mitchellh/vault/vault_${VAULT_VER}_linux_amd64.zip
ENV VAULT_MD5 0ba0029ddccb737cd2dbb1f018136535
ENV VAULT_FILE vault.zip
ENV VAULT_ADDR https://127.0.0.1:8200

RUN wget -O $VAULT_FILE $VAULT_URL \
    && echo "$VAULT_MD5  $VAULT_FILE" | md5sum -c \
    && unzip $VAULT_FILE -d /usr/bin/ \
    && chmod +x /usr/bin/vault \
    && rm $VAULT_FILE

COPY vault /etc/vault

VOLUME /var/lib/vault

EXPOSE 8200

CMD ["vault", "server", "-config=/etc/vault/vault.hcl"]
