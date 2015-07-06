#
# Dockerfile for ferm
#

FROM alpine
MAINTAINER kev <noreply@datageek.info>

RUN apk add -U ferm && rm -rf /var/cache/apk/*

ENTRYPOINT ["ferm", "--remote"]
CMD ["-"]
