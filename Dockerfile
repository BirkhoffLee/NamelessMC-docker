FROM php:7.0-apache

RUN docker-php-source extract \
    && apt-get update \
    && apt-get install libmcrypt-dev libldap2-dev nano libpng12-dev libjpeg62-turbo-dev libfreetype6-dev curl tar -y \
    && docker-php-ext-install pdo pdo_mysql mysqli \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd mcrypt \
    && a2enmod rewrite \
    && docker-php-source delete \
    && curl -Lo nameless.tar.gz https://github.com/NamelessMC/Nameless/archive/v1.0.15.tar.gz \
    && tar -xvf nameless.tar.gz \
    && mv Nameless-1.0.15/* /var/www/html/ \
    && rm nameless.tar.gz \ 
    && apt-get clean \ 
    && apt-get autoclean \ 
    && apt-get autoremove --purge -y \ 
    && rm -rf /var/lib/{apt,dpkg,cache,log}/ /tmp/* /var/tmp/*

RUN chmod 755 -R /var/www/html