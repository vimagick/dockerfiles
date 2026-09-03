#
# Dockerfile for frp
#

FROM alpine:3.24
MAINTAINER EasyPi Software Foundation

ARG TARGETPLATFORM
ARG FRP_VERSION

ENV FRP_HOME=/opt/frp
ENV PATH="${FRP_HOME}/bin:${PATH}"

WORKDIR ${FRP_HOME}

RUN set -xe \
    && FRP_ARCH=$(echo $TARGETPLATFORM | sed -e 's@linux/@@') \
    && FRP_FILE=frp_${FRP_VERSION}_linux_${FRP_ARCH}.tar.gz \
    && FRP_URL=https://github.com/fatedier/frp/releases/download/v${FRP_VERSION}/${FRP_FILE} \
    && apk add --no-cache curl tar \
    && mkdir -p bin etc \
    && curl -sSL ${FRP_URL} | tar xz --strip 1 -C bin \
    && frps --version \
    && frpc --version \
    && apk del curl tar

EXPOSE 7000/tcp 7000/udp 7500/tcp

CMD ["frps", "-c", "./etc/frps.toml"]
