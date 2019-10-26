#
# Dockerfile for i2pd-arm
#

FROM arm32v7/debian:stretch
MAINTAINER EasyPi Software Foundation

ENV I2PD_VERSION=2.27.0
ENV I2PD_ARCH=armhf
ENV I2PD_DIST=stretch
ENV I2PD_URL=https://github.com/PurpleI2P/i2pd/releases/download/${I2PD_VERSION}/i2pd_${I2PD_VERSION}-1${I2PD_DIST}1_${I2PD_ARCH}.deb

RUN set -ex \
    && apt-get update \
    && apt-get install -y wget \
    && { \
         wget ${I2PD_URL} -O i2pd.deb; \
         dpkg -i i2pd.deb; \
         apt-get -f install -y; \
         sed -i '/^address =/s/127.0.0.1/0.0.0.0/' /etc/i2pd/i2pd.conf; \
         rm i2pd.deb; \
       } \
    && apt-get remove -y wget \
    && rm -rf /var/lib/apt/lists/*

VOLUME /etc/i2pd /var/lib/i2pd

EXPOSE 4444 4447 7070

ENTRYPOINT ["i2pd"]
CMD [                                          \
      "--conf=/etc/i2pd/i2pd.conf",            \
      "--tunconf=/etc/i2pd/tunnels.conf",      \
      "--tunnelsdir=/etc/i2pd/tunnels.conf.d", \
      "--service"                              \
    ]
