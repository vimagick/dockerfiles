#
# Dockerfile for nifi
#

FROM java:8-jre-alpine
MAINTAINER kev <noreply@easypi.pro>

ENV NIFI_VERSION 1.10.0
ENV NIFI_FILE nifi-${NIFI_VERSION}-bin.tar.gz
ENV NIFI_URL https://archive.apache.org/dist/nifi/${NIFI_VERSION}/${NIFI_FILE}
ENV NIFI_HOME /opt/nifi

WORKDIR $NIFI_HOME

RUN set -xe \
    && apk add --no-cache bash curl tar \
    && curl -fSL ${NIFI_URL} | tar xz --strip-components=1 \
    && apk del curl tar \
    && addgroup -g 1000 nifi \
    && adduser -h ${NIFI_HOME} -s /bin/bash -G nifi -u 1000 -D -H nifi \
    && mkdir -p content_repository database_repository flowfile_repository provenance_repository \
    && chown -R nifi:nifi ${NIFI_HOME}

VOLUME ${NIFI_HOME}/content_repository  \
       ${NIFI_HOME}/database_repository \
       ${NIFI_HOME}/flowfile_repository \
       ${NIFI_HOME}/provenance_repository

EXPOSE 8080 8081

USER nifi

ENTRYPOINT ["/opt/nifi/bin/nifi.sh"]
CMD ["run"]
