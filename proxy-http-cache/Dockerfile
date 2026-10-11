#
# Dockerfile for proxy-http-cache
#

FROM python:3.14-alpine
MAINTAINER EasyPi Software Foundation

WORKDIR /app

RUN apk add --virtual .build-deps curl tar build-base libffi-dev openssl-dev \
    && curl -sSfL https://github.com/yigitkonur/proxy-http-cache/archive/refs/heads/main.tar.gz | tar xz --strip 1 \
    && pip install --no-cache-dir -r requirements.txt \
    && apk del .build-deps

EXPOSE 8000

CMD ["uvicorn", "main:app"]
