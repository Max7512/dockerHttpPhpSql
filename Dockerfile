FROM php:8.4-apache

COPY ./config/apache2.conf /etc/apache2/apache2.conf
COPY ./config/php.ini $PHP_INI_DIR/php.ini