FROM php:8.1-fpm-alpine

ADD ./php/www.conf /usr/local/etc/php-fpm.d/www.conf

RUN addgroup -g 1000 phportable && adduser -G phportable -g phportable -s /bin/sh -D phportable

RUN mkdir -p /var/www/html

RUN docker-php-ext-install mysqli

RUN chown phportable:phportable /var/www/html
