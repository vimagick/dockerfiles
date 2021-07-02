FROM tensorflow/tensorflow:latest-py3
RUN pip install --no-cache-dir ludwig[full]
WORKDIR /data
ENTRYPOINT ["ludwig"]
