#
# Dockerfile for tesseract CJK
#

FROM alpine:3
MAINTAINER EasyPi Software Foundation

RUN set -xe \
    && apk add --no-cache \
        tesseract-ocr \
        tesseract-ocr-data-chi_sim \
        tesseract-ocr-data-chi_tra \
        tesseract-ocr-data-jpn \
        tesseract-ocr-data-kor \
    && tesseract --version \
    && tesseract --list-langs

ENTRYPOINT ["tesseract"]
CMD ["--help-extra"]
