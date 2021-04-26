#
# Dockerfile for live555
#

FROM centos:8
MAINTAINER EasyPi Software Foundation

RUN set -xe \
    && yum install -y compat-openssl10 wget \
    && wget -qP /usr/local/bin/ http://www.live555.com/mediaServer/linux/live555MediaServer \
    && chmod +x /usr/local/bin/live555MediaServer

WORKDIR /data

EXPOSE 80 554

ENTRYPOINT ["live555MediaServer"]
