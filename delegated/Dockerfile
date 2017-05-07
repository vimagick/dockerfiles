#
# Dockerfile for delegated
#

FROM debian
MAINTAINER kev <noreply@easypi.pro>

ENV DG_VERSION 9_9_13
ENV DG_FILE linux2.6-dg${DG_VERSION}.tar.gz
ENV DG_DIR dg${DG_VERSION}
ENV DG_URL http://delegate.hpcc.jp/anonftp/DeleGate/bin/linux/latest/${DG_FILE}

RUN set -xe \
    && apt-get update \
    && apt-get install -y wget \
    && wget ${DG_URL} -O ${DG_FILE} \
    && tar xzf ${DG_FILE} \
    && cp ${DG_DIR}/DGROOT/bin/${DG_DIR} /bin/delegated \
    && apt-get remove -y wget \
    && rm -rf ${DG_FILE} \
              ${DG_DIR} \
              /var/lib/apt/lists/*

COPY delegated.conf /etc/

ENTRYPOINT ["/bin/delegated"]
