#
# Dockerfile for jinjanator
#

FROM alpine:3.20
MAINTAINER EasyPi Software Foundation

RUN set -xe \
 && apk add --no-cache py3-pip \
 && mkdir -p ~/.config/pip/ \
 && echo -e '[global]\nbreak-system-packages = true' > ~/.config/pip/pip.conf \
 && pip3 install jinjanator \
                 jinjanator-plugin-ansible \
                 jinjanator-plugin-format-toml \
                 jinjanator-plugin-format-xml \
 && jinjanate --version

ENTRYPOINT ["jinjanate"]
CMD ["--help"]
