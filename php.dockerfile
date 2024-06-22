FROM php:8.1-fpm-alpine

WORKDIR /code/Projects

ADD ./php/www.conf /usr/local/etc/php-fpm.d/www.conf


#RUN addgroup --gid 1000 phportable
#RUN adduser --ingroup phportable --shell /bin/sh phportable
#USER phportable

RUN docker-php-ext-install mysqli pdo pdo_mysql


RUN apk --no-cache add mysql-dev ${PHPIZE_DEPS} \
    && docker-php-ext-enable mysqli \
    && apk del ${PHPIZE_DEPS}

# Copy existing application directory contents
COPY ./src .

RUN addgroup --gid 1000 phportable
RUN adduser --ingroup phportable --shell /bin/sh phportable

USER phportable



