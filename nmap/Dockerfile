#
# Dockerfile for nmap
#

FROM alpine:3.24
MAINTAINER EasyPi Software Foundation

RUN apk add --no-cache nmap nmap-ncat nmap-scripts

ENTRYPOINT ["nmap"]
CMD ["--help"]
