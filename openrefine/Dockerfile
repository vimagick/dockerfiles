#
# Dockerfile for openrefine
#

FROM openjdk:11
MAINTAINER EasyPi Software Foundation

ENV OPENREFINE_VERSION=3.5.1
ENV OPENREFINE_FILE=openrefine-linux-${OPENREFINE_VERSION}.tar.gz
ENV OPENREFINE_URL=https://github.com/OpenRefine/OpenRefine/releases/download/${OPENREFINE_VERSION}/${OPENREFINE_FILE}

WORKDIR /app

RUN curl -sSL ${OPENREFINE_URL} | tar xz --strip 1

VOLUME /data
WORKDIR /data

EXPOSE 3333

ENTRYPOINT ["/app/refine"]
CMD ["-i", "0.0.0.0", "-d", "/data"]
