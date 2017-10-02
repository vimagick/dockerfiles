#
# Dockerfile for drone-scp-arm
#

FROM easypi/alpine-arm
MAINTAINER EasyPi Software Foundation

RUN apk add --no-cache ca-certificates
ADD drone-scp /bin

ENTRYPOINT ["drone-scp"]
