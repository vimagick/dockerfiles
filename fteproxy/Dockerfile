#
# Dockerfile for fteproxy
#

FROM alpine
MAINTAINER kev <norelpy@easypi.pro>

RUN set -xe \
    && apk add -U build-base \
                  gmp \
                  gmp-dev \
                  libstdc++ \
                  python \
                  python-dev \
                  py-pip \
    && pip install fteproxy \
    && apk del build-base \
               gmp-dev \
               python-dev \
    && rm -rf /root/.cache /var/cache/apk/*

ENV MODE server
ENV UPSTREAM_FORMAT manual-http-request
ENV DOWNSTREAM_FORMAT manual-http-response
ENV CLIENT_IP 127.0.0.1
ENV CLIENT_PORT 8079
ENV SERVER_IP 127.0.0.1
ENV SERVER_PORT 8080
ENV PROXY_IP 127.0.0.1
ENV PROXY_PORT 8081
ENV RELEASE 20131224
ENV KEY FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000

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
