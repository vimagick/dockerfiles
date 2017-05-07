#
# Dockerfile for plex
#

FROM debian:jessie
MAINTAINER kev <noreply@easypi.pro>

ENV PLEX_VERSION 0.9.16.6.1993-5089475
ENV PLEX_FILE plexmediaserver_${PLEX_VERSION}_amd64.deb
ENV PLEX_URL https://downloads.plex.tv/plex-media-server/${PLEX_VERSION}/${PLEX_FILE}

RUN set -xe \
    && apt-get update \
    && apt-get install -y curl \
    && curl -sSL ${PLEX_URL} -o ${PLEX_FILE} \
    && dpkg -i ${PLEX_FILE} \
    && apt-get install -f \
    && rm -rf ${PLEX_FILE} /var/lib/apt/lists/*

ENV PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR "/var/lib/plexmediaserver/Library/Application Support"
ENV PLEX_MEDIA_SERVER_HOME /usr/lib/plexmediaserver
ENV PLEX_MEDIA_SERVER_MAX_PLUGIN_PROCS 6
ENV PLEX_MEDIA_SERVER_TMPDIR /tmp
ENV LD_LIBRARY_PATH /usr/lib/plexmediaserver
ENV LANG en_US.utf8

RUN set -xe \
    && mkdir -p "${PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR}" \
    && chmod -R a+rwX "${PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR}"

VOLUME "${PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR}"

EXPOSE 1900/udp \
       3005/tcp \
       5353/udp \
       8324/tcp \
       32400/tcp \
       32410/udp \
       32412/udp \
       32413/udp \
       32414/udp \
       32469/tcp

CMD set -xe \
    && rm -f "${PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR}/Plex Media Server/plexmediaserver.pid" \
    && "/usr/lib/plexmediaserver/Plex Media Server"
