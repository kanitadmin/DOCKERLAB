FROM php:8.2-apache
LABEL maintainer="Kanit Tura <kanitt@buu.ac.th>"
ENV TZ=Asia/Bangkok
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"
RUN apt-get update && apt-get -y install apt-transport-https wget nano cron iputils-ping
ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
RUN chmod +x /usr/local/bin/install-php-extensions
RUN install-php-extensions apcu bcmath bz2 calendar decimal exif gd gettext gmp igbinary imagick intl json_post ldap mcrypt memcache memcached msgpack mysqli oci8 pdo_dblib pdo_mysql pdo_sqlsrv shmop snmp soap sockets sodium sqlsrv sysvmsg sysvsem sysvshm tidy uuid xlswriter xmldiff xmlrpc xsl yaml zip opcache csv ffi ion pcntl
RUN install-php-extensions @composer
