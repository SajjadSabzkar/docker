FROM nginx:stable-alpine

ADD ./nginx/default.conf /etc/nginx/conf.d/default.conf

RUN addgroup -g 1000 phportable && adduser -G phportable -g phportable -s /bin/sh -D phportable

RUN mkdir -p /var/www/html
