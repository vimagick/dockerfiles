#
# Dockerfile for nfs
#

FROM debian:bullseye
MAINTAINER EasyPi Software Foundation

RUN set -xe \
 && apt update \
 && apt install -y --no-install-recommends nfs-ganesha nfs-ganesha-vfs tini \
 && rm -rf /var/lib/apt/lists/*

COPY ./docker-entrypoint.sh /entrypoint.sh

EXPOSE 2049

ENTRYPOINT ["tini", "--"]
CMD ["/entrypoint.sh"]
