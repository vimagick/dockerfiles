#
# Dockerfile for portia
#

FROM ubuntu:14.04

WORKDIR /app

RUN set -xe \
    && apt-get update \
    && apt-get install -y git \
    && git clone https://github.com/scrapinghub/portia.git . \
    && apt-get remove -y git \
    && rm -rf /var/lib/apt/list/*

RUN /app/provision.sh \
        install_deps \
        install_splash \
        install_python_deps \
        configure_nginx \
        cleanup

ENV PYTHONPATH /app/slybot:/app/slyd

EXPOSE 9001

WORKDIR /app/slyd

CMD service nginx start; bin/slyd -p 9002 -r /app/slyd/dist
