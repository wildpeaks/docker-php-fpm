FROM ubuntu:20.04

RUN export DEBIAN_FRONTEND=noninteractive; \
    export DEBCONF_NONINTERACTIVE_SEEN=true; \
    apt-get update \
 && apt-get install -y --no-install-recommends \
    php-fpm=2:7.4+75 \
    php-json=2:7.4+75 \
    curl=7.68.0-1ubuntu2.5 \
    libcurl4=7.68.0-1ubuntu2.5 \
    php-curl=2:7.4+75 \
    php-pgsql=2:7.4+75 \
    php-xml=2:7.4+75 \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN sed -i -e 's/^listen = .*$/listen = 0.0.0.0:9000/' /etc/php/7.4/fpm/pool.d/www.conf;
EXPOSE 9000

ENTRYPOINT ["php-fpm7.4","--nodaemonize"]
