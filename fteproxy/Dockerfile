#
# Dockerfile for fteproxy
#

FROM python:3.14-alpine AS builder

ARG FTEPROXY_VERSION

RUN apk add --no-cache build-base libffi-dev openssl-dev \
 && python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"
RUN pip install --no-cache-dir fteproxy==${FTEPROXY_VERSION} \
 && python -m fteproxy --version

FROM python:3.14-alpine

COPY --from=builder /opt/venv /opt/venv

ENV PATH="/opt/venv/bin:$PATH"
RUN python -m fteproxy --version

ENTRYPOINT ["python", "-m", "fteproxy"]
CMD ["--help"]
