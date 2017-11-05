#
# Dockerfile for cowrie-arm
#

FROM easypi/alpine-arm
MAINTAINER EasyPi Software Foundation

RUN apk add -U bash \
               build-base \
               ca-certificates \
               libffi \
               libffi-dev \
               openssl \
               openssl-dev \
               python \
               python-dev \
               tar \
    && wget -qO- https://bootstrap.pypa.io/get-pip.py | python \
    && adduser -D cowrie \
    && cd /home/cowrie \
    && wget -qO- https://github.com/micheloosterhof/cowrie/archive/master.tar.gz | tar xz --strip 1 \
    && pip install -r requirements.txt \
    && sed '/Enable Telnet/{n;s/\(enabled\).*/\1 = true/}' cowrie.cfg.dist > cowrie.cfg \
    && sed -i 's/^\(VIRTUALENV_ENABLED\).*/\1=no/' bin/cowrie \
    && chown -R cowrie:cowrie . \
    && apk del build-base \
               libffi-dev \
               openssl-dev \
               python-dev \
               tar \
    && rm -rf /var/cache/apk/*

EXPOSE 2222 2223

USER cowrie
WORKDIR /home/cowrie

CMD ["bin/cowrie", "start", "-n"]
