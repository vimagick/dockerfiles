#
# Dockerfile for registry-cli
#

FROM python:3-slim-bullseye AS build
WORKDIR /app
ADD https://github.com/andrey-pohilko/registry-cli/raw/master/registry.py .
ADD https://github.com/andrey-pohilko/registry-cli/raw/master/requirements-ci.txt .
RUN set -xe \
 && apt update \
 && apt install -y binutils \
 && pip install --no-cache-dir pyinstaller \
 && pip install --no-cache-dir -r requirements-ci.txt \
 && pyinstaller --onefile --name=registry-cli registry.py \
 && rm -rf /var/lib/apt/lists/*

FROM debian:bullseye
MAINTAINER EasyPi Software Foundation
COPY --from=build /app/dist/registry-cli /usr/local/bin/
ENTRYPOINT ["registry-cli"]
CMD ["--help"]
