#
# Dockerfile for rehook
#

FROM golang:alpine AS build
ENV CGO_ENABLED=0
ENV GOOS=linux
ENV GOARCH=amd64
ENV GO111MODULE=off
WORKDIR /go/bin
RUN apk add --no-cache git
RUN go get -d -v github.com/jstemmer/rehook
RUN go build --ldflags '-s -extldflags "-static"' -i -o rehook github.com/jstemmer/rehook

FROM alpine:3
MAINTAINER EasyPi Software Foundation
WORKDIR /opt/rehook
RUN mkdir -p bin log var
RUN apk add --no-cache bash coreutils curl jq
COPY --from=build /go/src/github.com/jstemmer/rehook/public public
COPY --from=build /go/src/github.com/jstemmer/rehook/views views
COPY --from=build /go/bin/rehook bin
EXPOSE 9000 9001
ENTRYPOINT ["bin/rehook"]
CMD ["-db", "var/rehook.db", "-http", ":9000", "-admin", ":9001"]
