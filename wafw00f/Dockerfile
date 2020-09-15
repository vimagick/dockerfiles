#
# Dockerfile for wafw00f
#

FROM alpine:3
MAINTAINER EasyPi Software Foundation

RUN set -xe \
    && apk add --no-cache python3 \
    && pip3 install wafw00f

ENTRYPOINT ["wafw00f"]
CMD ["--help"]
