#
# Dockerfile for mysql-proxy
#

FROM debian:jessie
MAINTAINER kev <noreply@easypi.pro>

RUN set -xe \
    && apt-get update \
    && apt-get install -y mysql-proxy \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 4040 4041

ENTRYPOINT ["mysql-proxy"]
CMD ["--help-all"]
