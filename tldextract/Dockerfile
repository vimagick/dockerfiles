#
# Dockerfile for tldextract
#

FROM alpine:3

RUN apk add --no-cache py3-pip \
 && pip install tldextract \
 && tldextract --update \
 && tldextract --version

ENTRYPOINT ["/usr/bin/tldextract"]
CMD ["--help"]
