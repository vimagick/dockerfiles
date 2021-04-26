#
# Dockerfile for superset-arm
#

FROM arm32v7/debian:buster
MAINTAINER EasyPi Software Foundation

# Configure environment
ENV SUPERSET_VERSION=1.1.0 \
    SUPERSET_REPO=apache/incubator-superset \
    SUPERSET_HOME=/var/lib/superset \
    PYTHONPATH=/etc/superset:/home/superset:$PYTHONPATH \
    LANG=C.UTF-8 \
    LC_ALL=C.UTF-8
ENV GUNICORN_BIND=0.0.0.0:8088 \
    GUNICORN_LIMIT_REQUEST_FIELD_SIZE=0 \
    GUNICORN_LIMIT_REQUEST_LINE=0 \
    GUNICORN_TIMEOUT=60 \
    GUNICORN_WORKERS=3 \
    GUNICORN_THREADS=4
ENV GUNICORN_CMD_ARGS="--workers ${GUNICORN_WORKERS} --threads ${GUNICORN_THREADS} --timeout ${GUNICORN_TIMEOUT} --bind ${GUNICORN_BIND} --limit-request-line ${GUNICORN_LIMIT_REQUEST_LINE} --limit-request-field_size ${GUNICORN_LIMIT_REQUEST_FIELD_SIZE}"

# Create superset user & install dependencies
RUN set -xe \
    && useradd -U -m superset \
    && mkdir /etc/superset \
    && mkdir ${SUPERSET_HOME} \
    && chown -R superset:superset /etc/superset \
    && chown -R superset:superset ${SUPERSET_HOME} \
    && apt-get update \
    && apt-get install -y \
        build-essential \
        curl \
        freetds-bin \
        freetds-dev \
        libffi-dev \
        libffi6 \
        libldap-2.4-2 \
        libldap2-dev \
        libmariadb-dev \
        libmariadb-dev-compat \
        libmariadb3 \
        libpq-dev \
        libpq5 \
        libsasl2-2 \
        libsasl2-dev \
        libssl-dev \
        libssl1.1 \
        python3 \
        python3-dev \
    && curl -sSL https://bootstrap.pypa.io/get-pip.py | python3 \
    && pip3 install --no-cache-dir \
        apache-superset==${SUPERSET_VERSION} \
        mysqlclient \
        psycopg2-binary \
        pyhive[hive,presto] \
        redis \
    && apt-get remove -y \
        build-essential \
        freetds-dev \
        libffi-dev \
        libldap2-dev \
        libmariadb-dev \
        libpq-dev \
        libsasl2-dev \
        libssl-dev \
        python3-dev \
    && apt-get clean \
    && rm -r /var/lib/apt/lists/*

# Configure Filesystem
COPY superset /usr/local/bin
VOLUME /home/superset \
       /etc/superset \
       /var/lib/superset
WORKDIR /home/superset

# Finalize application
EXPOSE 8088
HEALTHCHECK CMD ["curl", "-f", "http://localhost:8088/health"]
CMD ["gunicorn", "superset:app"]
USER superset
