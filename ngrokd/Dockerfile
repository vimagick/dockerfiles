#
# Dockerfile for ngrokd
#

FROM debian:jessie
MAINTAINER kev <noreplay@easypi.pro>

ENV NGROK_GIT https://github.com/inconshreveable/ngrok.git
ENV NGROK_BASE_DOMAIN ngrok.foobar.site
ENV NGROK_DIR /ngrok
ENV NGROK_TMP /tmp/ngrok

ENV NGROK_CA_KEY assets/client/tls/ngrokroot.key
ENV NGROK_CA_CRT assets/client/tls/ngrokroot.crt
ENV NGROK_SERVER_KEY assets/server/tls/snakeoil.key
ENV NGROK_SERVER_CSR assets/server/tls/snakeoil.csr
ENV NGROK_SERVER_CRT assets/server/tls/snakeoil.crt

WORKDIR $NGROK_DIR

RUN apt-get update \
    && apt-get install -y build-essential \
                          curl \
                          git \
                          golang \
                          mercurial \
    && git clone ${NGROK_GIT} ${NGROK_TMP} \
    && cd ${NGROK_TMP} \
    && openssl genrsa -out ${NGROK_CA_KEY} 2048 \
    && openssl req -new -x509 -nodes -key ${NGROK_CA_KEY} -subj "/CN=${NGROK_BASE_DOMAIN}" -days 365 -out ${NGROK_CA_CRT} \
    && openssl genrsa -out ${NGROK_SERVER_KEY} 2048 \
    && openssl req -new -key ${NGROK_SERVER_KEY} -subj "/CN=${NGROK_BASE_DOMAIN}" -out ${NGROK_SERVER_CSR} \
    && openssl x509 -req -in ${NGROK_SERVER_CSR} -CA ${NGROK_CA_CRT} -CAkey ${NGROK_CA_KEY} -CAcreateserial -days 365 -out ${NGROK_SERVER_CRT} \
    && for GOOS in darwin linux windows; \
       do \
         for GOARCH in 386 amd64 arm; \
         do \
           echo "=== $GOOS-$GOARCH ==="; \
           export GOOS GOARCH; \
           make release-all; \
           echo "=== done ==="; \
         done \
       done \
    && mv ${NGROK_CA_KEY} \
          ${NGROK_CA_CRT} \
          ${NGROK_SERVER_KEY} \
          ${NGROK_SERVER_CSR} \
          ${NGROK_SERVER_CRT} \
          ./bin/* \
          ${NGROK_DIR} \
    && apt-get purge --auto-remove -y build-essential \
                                      curl \
                                      git \
                                      golang \
                                      mercurial \
    && cd ${NGROK_DIR} \
    && rm -rf ${NGROK_TMP}

VOLUME $NGROK_DIR
EXPOSE 80 443 4443

ENTRYPOINT ["./ngrokd"]
