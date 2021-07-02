#
# Dockerfile for mediagoblin
#

FROM debian:jessie
MAINTAINER kev <noreply@easypi.pro>

RUN set -xe \
    && apt-get update \
    && apt-get install -y automake \
                          gir1.2-gst-plugins-base-1.0 \
                          gir1.2-gstreamer-1.0 \
                          git-core \
                          gstreamer1.0-libav \
                          gstreamer1.0-plugins-bad \
                          gstreamer1.0-plugins-base \
                          gstreamer1.0-plugins-good \
                          gstreamer1.0-plugins-ugly \
                          gstreamer1.0-tools \
                          libasound2-dev \
                          libgstreamer-plugins-base1.0-dev \
                          libsndfile1-dev \
                          nginx \
                          nodejs-legacy \
                          npm \
                          poppler-utils \
                          python \
                          python-dev \
                          python-gi \
                          python-gst-1.0 \
                          python-gst-1.0 \
                          python-imaging \
                          python-lxml \
                          python-numpy \
                          python-scipy \
                          python-virtualenv \
                          python3-gi \
                          sudo \
    && rm -rf /var/lib/apt/lists/*

RUN set -xe \
    && useradd -d /var/lib/mediagoblin -m -r -g www-data mediagoblin \
    && groupadd -r mediagoblin \
    && usermod -a -G mediagoblin mediagoblin \
    && mkdir -p /var/log/mediagoblin \
                /srv/mediagoblin.example.org/mediagoblin \
    && chown -hR mediagoblin:www-data /var/log/mediagoblin \
                                      /srv/mediagoblin.example.org \
    && echo 'mediagoblin ALL=(ALL:ALL) NOPASSWD: /usr/sbin/nginx, /bin/chown' >> /etc/sudoers

USER mediagoblin

WORKDIR /srv/mediagoblin.example.org/mediagoblin

RUN set -xe \
    && git clone http://git.savannah.gnu.org/r/mediagoblin.git . \
    && git checkout stable \
    && git submodule sync \
    && git submodule update --force --init --recursive \
    && ./bootstrap.sh \
    && ./configure \
    && make \
    && bin/easy_install flup==1.0.3.dev-20110405 \
    && bin/pip install --no-cache-dir scikits.audiolab \
    && ln -s /var/lib/mediagoblin user_dev \
    && cp -av mediagoblin.ini mediagoblin_local.ini \
    && cp -av paste.ini paste_local.ini \
    && sed -i 's@.*sql_engine = .*@sql_engine = sqlite:////var/lib/mediagoblin/mediagoblin.db@' mediagoblin_local.ini \
    && { \
        echo '[[mediagoblin.media_types.video]]'; \
        echo '[[mediagoblin.media_types.audio]]'; \
        echo '[[mediagoblin.media_types.pdf]]'; \
       } >> mediagoblin_local.ini

COPY nginx.conf /etc/nginx/sites-enabled/default

VOLUME /var/lib/mediagoblin

EXPOSE 80

ENV MG_USER admin
ENV MG_PASS admin
ENV MG_MAIL admin@easypi.pro

CMD set -xe \
    && sudo nginx \
    && sudo chown -hR mediagoblin:www-data /var/lib/mediagoblin \
    && { \
        bin/gmg dbupdate; \
        bin/gmg adduser --username "${MG_USER}" --password "${MG_PASS}" --email "${MG_MAIL}"; \
        bin/gmg makeadmin "${MG_USER}"; \
       } \
    && ./lazyserver.sh --server-name=fcgi fcgi_host=127.0.0.1 fcgi_port=26543
