#
# Dockerfile for phpmyadmin-arm
#

FROM easypi/alpine-arm
MAINTAINER EasyPi Software Foundation

# Install dependencies
RUN apk add --no-cache php7-session php7-mysqli php7-mbstring php7-xml php7-gd php7-zlib php7-bz2 php7-zip php7-openssl php7-curl php7-opcache php7-json nginx php7-fpm supervisor

# Calculate download URL
ENV VERSION 4.7.5
ENV URL https://files.phpmyadmin.net/phpMyAdmin/${VERSION}/phpMyAdmin-${VERSION}-all-languages.tar.gz
LABEL version=$VERSION

# Download tarball, verify it using gpg and extract
RUN set -x \
    && GNUPGHOME="$(mktemp -d)" \
    && export GNUPGHOME \
    && apk add --no-cache curl gnupg tar \
    && curl -sSL https://github.com/phpmyadmin/docker/archive/${VERSION}-1.tar.gz | \
       tar xz --strip 1 -C / docker-${VERSION}-1/etc docker-${VERSION}-1/run.sh docker-${VERSION}-1/phpmyadmin.keyring \
    && curl --output phpMyAdmin.tar.gz --location $URL \
    && curl --output phpMyAdmin.tar.gz.asc --location $URL.asc \
    && gpgv --keyring /phpmyadmin.keyring phpMyAdmin.tar.gz.asc phpMyAdmin.tar.gz \
    && apk del --no-cache curl gnupg tar \
    && rm -rf "$GNUPGHOME" \
    && tar xzf phpMyAdmin.tar.gz \
    && rm -f phpMyAdmin.tar.gz phpMyAdmin.tar.gz.asc \
    && mv phpMyAdmin-$VERSION-all-languages /www \
    && rm -rf /www/setup/ /www/examples/ /www/test/ /www/po/ /www/composer.json /www/RELEASE-DATE-$VERSION \
    && sed -i "s@define('CONFIG_DIR'.*@define('CONFIG_DIR', '/etc/phpmyadmin/');@" /www/libraries/vendor_config.php \
    && chown -R root:nobody /www \
    && find /www -type d -exec chmod 750 {} \; \
    && find /www -type f -exec chmod 640 {} \;

# Add directory for sessions to allow session persistence
RUN mkdir /sessions

# We expose phpMyAdmin on port 80
EXPOSE 80

ENTRYPOINT [ "/run.sh" ]
CMD ["phpmyadmin"]
