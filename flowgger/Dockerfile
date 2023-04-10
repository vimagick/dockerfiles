#
# Dockerfile for flowgger
#

FROM rust:1.68-alpine AS builder

WORKDIR /usr/src/flowgger

RUN set -xe \
 && apk add --no-cache curl tar musl-dev libressl-dev capnproto-dev \
 && curl -sSL https://github.com/awslabs/flowgger/archive/refs/heads/master.tar.gz | tar xz --strip 1

RUN set -xe \
 && cargo build --release \
 && strip target/release/flowgger \
 && target/release/flowgger --version

FROM alpine:3
MAINTAINER EasyPi Software Foundation

WORKDIR /opt/flowgger

COPY --from=builder /usr/src/flowgger/target/release/flowgger bin/flowgger
COPY --from=builder /usr/src/flowgger/flowgger.toml etc/flowgger.toml

RUN apk add --no-cache libssl3 && bin/flowgger --version

ENTRYPOINT ["bin/flowgger"]
CMD ["etc/flowgger.toml"]

