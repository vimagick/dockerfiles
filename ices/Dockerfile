#
# Dockerfile for ices
#

FROM alpine
MAINTAINER kev <noreply@easypi.info>

RUN apk add --no-cache ices
COPY data /etc/ices

CMD ["ices", "/etc/ices/ices.xml"]
