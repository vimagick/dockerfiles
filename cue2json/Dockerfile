#
# Dockerfile for cue2json
#

FROM python:3.14-alpine AS builder

RUN apk add --no-cache \
    bison \
    flex \
    make \
    gcc \
    musl-dev \
    python3-dev

WORKDIR /build

RUN pip install --no-cache-dir --upgrade pip setuptools Cython build

RUN pip install --no-cache-dir --prefix=/install \
    pylibcue \
    flask \
    pyyaml \
    chardet

FROM python:3.14-alpine

WORKDIR /app

COPY --from=builder /install /usr/local

COPY app.py .

EXPOSE 5000

CMD ["python", "app.py"]
