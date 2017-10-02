#
# Dockerfile for drone-rsync-arm
#

FROM easypi/alpine-arm
MAINTAINER EasyPi Software Foundation

RUN apk add --no-cache bash ca-certificates curl openssh-client rsync
RUN curl -sSL https://github.com/Drillster/drone-rsync/raw/master/upload.sh > /usr/local/bin/upload.sh
RUN chmod +x /usr/local/bin/upload.sh

ENTRYPOINT ["upload.sh"]
