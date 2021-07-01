#
# Dockerfile for obfsproxy-arm (scramblesuit)
#

FROM easypi/alpine-arm
MAINTAINER EasyPi Software Foundation

RUN set -xe \
    && apk add --no-cache build-base curl python python-dev \
    && curl -sSL https://bootstrap.pypa.io/get-pip.py | python \
    && pip install --no-cache-dir obfsproxy \
    && apk del build-base curl python-dev

ENV LOG_MIN_SEVERITY info
ENV DATA_DIR /var/lib/obfsproxy
ENV PASSWORD XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
ENV DEST_ADDR openvpn
ENV DEST_PORT 1194
ENV RUN_MODE server
ENV LISTEN_ADDR 0.0.0.0
ENV LISTEN_PORT 4911

CMD obfsproxy --log-min-severity=$LOG_MIN_SEVERITY \
              --data-dir=$DATA_DIR \
              scramblesuit \
              --password=$PASSWORD \
              --dest=$DEST_ADDR:$DEST_PORT \
              $RUN_MODE \
              $LISTEN_ADDR:$LISTEN_PORT

