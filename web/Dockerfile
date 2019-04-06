FROM php:7.3-apache

RUN mkdir /home/www

# ENV
ENV WWW_DIR /home/www
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data

COPY config/sites-available/heimdall.watch.conf /etc/apache2/sites-available/heimdall.watch.conf

# Apache
RUN a2enmod rewrite
RUN a2ensite heimdall.watch
RUN a2dissite 000-default

## Libs
RUN apt-get update || apt-get update \
    	&& apt-get install -my sudo git libpq-dev zip unzip libzip-dev zlib1g-dev libicu-dev g++

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
RUN useradd -ms /bin/bash --groups www-data heimdall

COPY start.sh /

RUN chmod u+x /start.sh

WORKDIR /home/www/

CMD "/start.sh"