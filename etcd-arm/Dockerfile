#
# Dockerfile for etcd-arm
#

FROM scratch
MAINTAINER kev <noreply@datageek.info>

ADD ca-certificates.crt /etc/ssl/certs/
ADD etcd /usr/local/bin/

EXPOSE 2379 2380 4001 7001

ENTRYPOINT ["etcd"]
