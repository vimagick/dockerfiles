#
# Dockerfile for Logstash-oss with OpenSearch output plugin
#
# - https://www.docker.elastic.co/r/logstash/logstash-oss
# - https://github.com/opensearch-project/logstash-output-opensearch
#

ARG LOGSTASH_OSS_VERSION
ARG LOGSTASH_OUTPUT_OPENSEARCH_VERSION
FROM docker.elastic.co/logstash/logstash-oss:${LOGSTASH_OSS_VERSION}
USER logstash
RUN /usr/share/logstash/bin/logstash-plugin install --version ${LOGSTASH_OUTPUT_OPENSEARCH_VERSION} logstash-output-opensearch