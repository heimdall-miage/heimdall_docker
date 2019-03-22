FROM php:7.3-apache

# MKDIR
RUN mkdir -p /home/log/apache
RUN mkdir /home/log/php
RUN mkdir /home/www

# Perms
RUN chown -R www-data:www-data /home/www
RUN chown -R www-data:www-data /home/log

RUN ls -al /home/log

# ENV
ENV WWW_DIR /home/www
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /home/log/apache

COPY config/sites-available/heimdall.watch.conf /etc/apache2/sites-available/heimdall.watch.conf
COPY config/php.ini /usr/local/etc/php/conf.d/custom.ini

# Apache
RUN a2enmod rewrite
RUN a2ensite heimdall.watch

## Libs
RUN apt-get update || apt-get update \
    	&& apt-get install -my git libpq-dev zip unzip libzip-dev zlib1g-dev libicu-dev g++

# PHP Exts
RUN docker-php-ext-install pdo_pgsql \
	&& docker-php-ext-configure zip --with-libzip \
	&& docker-php-ext-install zip \
	&& docker-php-ext-configure intl \
	&& docker-php-ext-install intl \
	&& docker-php-ext-configure opcache \
	&& docker-php-ext-install opcache

# Composer
RUN curl -sS https://getcomposer.org/installer | php && \
	mv composer.phar /usr/local/bin/composer

# User heimdall
RUN useradd -ms /bin/bash heimdall
RUN usermod -a -G www-data heimdall

WORKDIR /home/www/heimdall_web