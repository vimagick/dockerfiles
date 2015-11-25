FROM alpine
MAINTAINER kev <noreply@datageek.info>

RUN apk add -U curl \
               py-pip \
               py-twisted \
               tar \
               gcc \
               python-dev \
               musl-dev \
               libffi-dev \
               openssl-dev \
    && pip install pyasn1 pyOpenSSL service_identity \
    && adduser -D cowrie \
    && cd /home/cowrie \
    && curl -sSL https://github.com/micheloosterhof/cowrie/archive/master.tar.gz | tar xz --strip 1 \
    && mv cowrie.cfg.dist cowrie.cfg \
    && chown -R cowrie:cowrie . \
    && apk del curl \
               tar \
    && rm -rf /var/cache/apk/*

EXPOSE 2222

USER cowrie
WORKDIR /home/cowrie

CMD ["twistd", "-n", "-l", "log/cowrie.log", "cowrie"]
