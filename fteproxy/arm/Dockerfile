#
# Dockerfile for fteproxy-arm
#

FROM alpine:3
MAINTAINER EasyPi Software Foundation

RUN set -xe \
    && apk add -U build-base \
                  curl \
                  gmp \
                  gmp-dev \
                  libstdc++ \
                  python2 \
                  python2-dev \
    && curl https://bootstrap.pypa.io/pip/2.7/get-pip.py | python \
    && pip install --no-cache-dir fteproxy \
    && apk del build-base \
               curl \
               gmp-dev \
               python2-dev \
    && rm -rf /root/.cache /var/cache/apk/*

ENV MODE=server
ENV UPSTREAM_FORMAT=manual-http-request
ENV DOWNSTREAM_FORMAT=manual-http-response
ENV CLIENT_IP=127.0.0.1
ENV CLIENT_PORT=8079
ENV SERVER_IP=127.0.0.1
ENV SERVER_PORT=8080
ENV PROXY_IP=127.0.0.1
ENV PROXY_PORT=8081
ENV RELEASE=20131224
ENV KEY=FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000

CMD fteproxy --mode $MODE \
             --upstream-format $UPSTREAM_FORMAT \
             --downstream-format $DOWNSTREAM_FORMAT \
             --client_ip $CLIENT_IP \
             --client_port $CLIENT_PORT \
             --server_ip $SERVER_IP \
             --server_port $SERVER_PORT \
             --proxy_ip $PROXY_IP \
             --proxy_port $PROXY_PORT \
             --release $RELEASE \
             --key $KEY
