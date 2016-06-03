#
# Dockerfile for gogs-arm
#

FROM easypi/alpine-arm:3.4
MAINTAINER kev <noreply@easypi.info>

ENV GOGS_CUSTOM /data/gogs

RUN set -xe \
    && apk add -U bash \
                  ca-certificates \
                  curl \
                  git \
                  linux-pam \
                  openssh \
                  s6 \
                  socat \
                  tar \
    && rm -rf /var/cache/apk/*

RUN set -xe \
    && adduser -H -D -g 'Gogs Git User' -h /data/git -s /bin/bash git \
    && passwd -u git \
    && echo "export GOGS_CUSTOM=${GOGS_CUSTOM}" >> /etc/profile

RUN set -xe \
    && curl -L https://github.com/tianon/gosu/releases/download/1.9/gosu-armhf > /usr/sbin/gosu \
    && chmod +x /usr/sbin/gosu

RUN set -xe \
    && mkdir /app/ \
    && cd /app/ \
    && curl -LO https://github.com/gogits/gogs/releases/download/v0.9.13/linux_arm.zip \
    && unzip linux_arm.zip \
    && rm linux_arm.zip

RUN set -xe \
    && cd /app/gogs/ \
    && curl -L https://github.com/gogits/gogs/archive/master.tar.gz | tar xz --strip 1 gogs-master/docker \
    && mv docker/nsswitch.conf /etc/

WORKDIR /app/gogs/
VOLUME /data/

EXPOSE 22 3000

CMD ["docker/start.sh", "/bin/s6-svscan", "/app/gogs/docker/s6/"]
