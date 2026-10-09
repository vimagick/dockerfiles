#
# Dockerfile for tshark
#

FROM alpine:3.24
MAINTAINER EasyPi Software Foundation

RUN apk add --no-cache libcap tshark
RUN setcap cap_net_raw,cap_net_admin=eip /usr/bin/dumpcap

ENTRYPOINT ["tshark"]
CMD ["--help"]
