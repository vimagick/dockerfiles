#
# Dockerfile for datax
#

FROM openjdk:8-alpine
MAINTAINER EasyPi Software Foundation

WORKDIR /opt/datax

RUN set -xe \
    && apk add --no-cache curl python2 tar \
    && curl -sSL http://datax-opensource.oss-cn-hangzhou.aliyuncs.com/datax.tar.gz | tar xz --strip 1 \
    && bin/datax.py --help \
    && apk del curl tar

ENV PATH=/opt/datax/bin:$PATH

ENTRYPOINT ["datax.py"]
CMD ["--help"]
