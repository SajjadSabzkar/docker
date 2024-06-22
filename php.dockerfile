FROM php:8.1-fpm-alpine

# Set the user and group IDs of the host user
ARG UID
ARG GID

RUN addgroup -g $GID myuser && \
adduser --disabled-password --gecos '' --uid $GID -g $GID myuser

    
RUN mkdir -p /code/Projects

WORKDIR /code/Projects

RUN chown myuser:myuser /code/Projects

ADD ./php/www.conf /usr/local/etc/php-fpm.d/www.conf

RUN docker-php-ext-install mysqli pdo pdo_mysql


RUN apk --no-cache add mysql-dev ${PHPIZE_DEPS} \
    && docker-php-ext-enable mysqli \
    && apk del ${PHPIZE_DEPS}


USER myuser

RUN touch vmss.txt


