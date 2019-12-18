#
# Dockerfile for prosdoy
#

FROM multiarch/debian-debootstrap:armhf-buster
MAINTAINER EasyPi Software Foundation

RUN set -xe \
    && echo "deb http://packages.prosody.im/debian $(lsb_release -sc) main" | tee -a /etc/apt/sources.list \
    && wget https://prosody.im/files/prosody-debian-packages.key -O- | apt-key add - \
    && apt-get update \
    && apt-get install -y prosody \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 80 443 5222 5269 5347 5280 5281

USER prosody
ENV __FLUSH_LOG yes
CMD ["prosody"]
