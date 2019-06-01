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
    	&& apt-get install -my sudo git libpq-dev zip unzip libzip-dev zlib1g-dev libicu-dev g++ gnupg apt-transport-https wget acl jpegoptim optipng

# Nodejs & Yarn
RUN apt-get remove cmdtest \
	&& apt-get remove yarn \
	&& curl -sL https://deb.nodesource.com/setup_8.x | bash - \
	&& curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
	&& echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update && apt-get install -y nodejs yarn libxml2 libxml2-utils libpng-dev

# PHP Exts
RUN docker-php-ext-install pdo_pgsql
RUN docker-php-ext-configure zip --with-libzip
RUN docker-php-ext-install zip
RUN docker-php-ext-configure intl
RUN docker-php-ext-install intl
RUN docker-php-ext-configure opcache
RUN docker-php-ext-install opcache
RUN docker-php-ext-install gd

# Composer
RUN curl -sS https://getcomposer.org/installer | php && \
	mv composer.phar /usr/local/bin/composer

# User heimdall
RUN useradd -ms /bin/bash --groups www-data heimdall

COPY start.sh /

RUN chmod u+x /start.sh

WORKDIR /home/www/

CMD "/start.sh"
