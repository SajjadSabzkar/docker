FROM php:8.1-fpm-alpine

ADD ./php/www.conf /usr/local/etc/php-fpm.d/www.conf

RUN groupadd -g 1000 www
RUN useradd -u 1000 -ms /bin/bash -g www www


#RUN addgroup --gid 1000 phportable
#RUN adduser --ingroup phportable --shell /bin/sh phportable
#USER phportable

RUN docker-php-ext-install mysqli pdo pdo_mysql


RUN apk --no-cache add mysql-dev ${PHPIZE_DEPS} \
    && docker-php-ext-enable mysqli \
    && apk del ${PHPIZE_DEPS}

# Copy existing application directory contents
COPY ./src /var/www/html

# Copy existing application directory permissions
COPY --chown=www:www ./src /var/www/html

# Change current user to www
USER www


#RUN mkdir -p /var/www/html
#RUN chown -R phportable:phportable /var/www




