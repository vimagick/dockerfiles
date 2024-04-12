#
# Dockerfile for gradio
#

FROM python:3.12-slim

ENV GRADIO_SERVER_NAME="0.0.0.0"

RUN pip install --no-cache-dir gradio

EXPOSE 7860

ENTRYPOINT ["python"]
