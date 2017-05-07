#
# Dockerfile for cowrie
#

FROM alpine
MAINTAINER kev <noreply@easypi.pro>

RUN apk add -U build-base \
               libffi \
               libffi-dev \
               openssl \
               openssl-dev \
               python \
               python-dev \
               tar \
    && wget -qO- https://bootstrap.pypa.io/get-pip.py | python \
    && pip install pyasn1 \
                   pyOpenSSL \
                   service_identity \
                   twisted \
    && adduser -D cowrie \
    && cd /home/cowrie \
    && wget -qO- https://github.com/micheloosterhof/cowrie/archive/master.tar.gz | tar xz --strip 1 \
    && mv cowrie.cfg.dist cowrie.cfg \
    && chown -R cowrie:cowrie . \
    && apk del build-base \
               libffi-dev \
               openssl-dev \
               python-dev \
               tar \
    && rm -rf /var/cache/apk/*

EXPOSE 2222

USER cowrie
WORKDIR /home/cowrie

CMD ["twistd", "-n", "-l", "log/cowrie.log", "cowrie"]
