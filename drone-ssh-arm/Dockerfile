#
# Dockerfile for drone-ssh-arm
#

FROM easypi/alpine-arm
MAINTAINER EasyPi Software Foundation

RUN apk add --no-cache ca-certificates openssh-client
ADD drone-ssh /bin

ENTRYPOINT ["drone-ssh"]
