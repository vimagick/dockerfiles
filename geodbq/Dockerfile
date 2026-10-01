#
# Dockerfile for geodbq
#

FROM golang:1.27-alpine AS builder
RUN apk add --no-cache git
WORKDIR /build
RUN CGO_ENABLED=0 GOBIN=/build go install -ldflags="-s -w" github.com/wanwire/geodbq@latest

FROM alpine:3.24
WORKDIR /data
ADD https://github.com/v2fly/geoip/releases/latest/download/geoip.dat geoip.dat
ADD https://github.com/v2ray/domain-list-community/releases/latest/download/dlc.dat geosite.dat
COPY --from=builder /build/geodbq /usr/local/bin/geodbq
ENTRYPOINT ["geodbq"]
CMD ["--help"]
