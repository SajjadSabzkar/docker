FROM php:8.1-fpm-alpine

# Set the user and group IDs of the host user
ARG USER_ID
ARG GROUP_ID

RUN addgroup --gid $GROUP_ID myuser && \
adduser --disabled-password --gecos '' --uid $USER_ID --gid $GROUP_ID myuser

RUN mkdir -p /code/Projects

WORKDIR /code/Projects

RUN chown myuser:myuser /code/Projects

ADD ./php/www.conf /usr/local/etc/php-fpm.d/www.conf


#RUN addgroup --gid 1000 phportable
#RUN adduser --ingroup phportable --shell /bin/sh phportable
#USER phportable

RUN docker-php-ext-install mysqli pdo pdo_mysql


RUN apk --no-cache add mysql-dev ${PHPIZE_DEPS} \
    && docker-php-ext-enable mysqli \
    && apk del ${PHPIZE_DEPS}


USER myuser

RUN touch vmss.txt


