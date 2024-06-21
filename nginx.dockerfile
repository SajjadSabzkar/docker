FROM nginx:stable-alpine

ADD ./nginx/default.conf /etc/nginx/conf.d/default.conf

RUN addgroup -g 1000 phportable && adduser -G phportable -g phportable -s /bin/sh -D phportable

RUN mkdir -p /var/www/html
RUN chown -R phportable:phportable /var/www/html
RUN chmod 775 /var/www/html

RUN mkdir -p /etc/nginx/certs/mkcert

ADD ./nginx/certs/ /etc/nginx/certs/mkcert
