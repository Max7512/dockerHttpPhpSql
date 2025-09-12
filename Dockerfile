FROM php:8.4-apache

COPY ./config/apache2.conf /etc/apache2/apache2.conf
COPY ./config/php.ini $PHP_INI_DIR/php.ini

RUN apt-get install && apt-get update
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer --version=2.1.14
RUN curl -sS https://get.symfony.com/cli/installer | bash