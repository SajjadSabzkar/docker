FROM php:8.1-fpm-alpine

ADD ./php/www.conf /usr/local/etc/php-fpm.d/www.conf

RUN addgroup -g 1000 phportable && adduser -G phportable -g phportable -s /bin/sh -D phportable

#RUN addgroup --gid 1000 phportable
#RUN adduser --ingroup phportable --shell /bin/sh phportable
USER phportable

RUN mkdir -p /var/www/html

RUN docker-php-ext-install mysqli pdo pdo_mysql


RUN apk --no-cache add mysql-dev ${PHPIZE_DEPS} \
    && docker-php-ext-enable mysqli \
    && apk del ${PHPIZE_DEPS}

RUN chown -R phportable:phportable /var/www
RUN chmod 775 -R /var/www

RUN chown -R www-data:root /var/www
