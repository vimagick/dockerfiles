#
# Dockerfile for ntopng
#

FROM ubuntu:20.04
MAINTAINER EasyPi Software Foundation

RUN set -xe \
    && apt update \
    && apt install -y curl gnupg libjson-c3 \
    && curl -sSL http://packages.ntop.org/apt-stable/ntop.key | apt-key add - \
    && { \
         echo "deb http://packages.ntop.org/apt/20.04/ x64/"; \
         echo "deb http://packages.ntop.org/apt/20.04/ all/"; \
       } > /etc/apt/sources.list.d/ntop.list \
    && apt update \
    && apt install -y ntopng \
    && rm -rf /var/lib/apt/lists/*

VOLUME /var/lib/ntopng

EXPOSE 3000 5556

ENTRYPOINT ["ntopng"]
CMD [                                         \
        "--community",                        \
        "--data-dir", "/var/lib/ntopng",      \
        "--http-port", "0.0.0.0:3000",        \
        "--interface", "tcp://0.0.0.0:5556c", \
        "--redis", "redis"                    \
    ]
