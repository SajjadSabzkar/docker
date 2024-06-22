FROM nginx:stable-alpine

# Set the user and group IDs of the host user
ARG UID
ARG GID


ADD ./nginx/default.conf /etc/nginx/conf.d/default.conf


RUN addgroup -g 1000 myuser \
    && adduser --disabled-password -G myuser -u 1000 myuser -D
    
RUN mkdir -p /code/Projects

WORKDIR /code/Projects

RUN chown myuser:myuser /code/Projects


RUN mkdir -p /etc/nginx/certs/mkcert

ADD ./nginx/certs/ /etc/nginx/certs/mkcert
