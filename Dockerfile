FROM ubuntu:18.04

# https://packages.ubuntu.com/bionic/php7.2-fpm
# https://packages.ubuntu.com/bionic/php7.2-json
# https://packages.ubuntu.com/bionic/curl
# https://packages.ubuntu.com/bionic/libcurl4
# https://packages.ubuntu.com/bionic/php7.2-curl
# https://packages.ubuntu.com/bionic/php7.2-pgsql
# https://packages.ubuntu.com/bionic/php7.2-xml
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
 php7.2-fpm=7.2.24-0ubuntu0.18.04.2 php7.2-json=7.2.24-0ubuntu0.18.04.2 \
 curl=7.58.0-2ubuntu3.8 libcurl4=7.58.0-2ubuntu3.8 php7.2-curl=7.2.24-0ubuntu0.18.04.2 \
 php7.2-pgsql=7.2.24-0ubuntu0.18.04.2 php7.2-xml=7.2.24-0ubuntu0.18.04.2
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN mkdir /run/php
RUN sed -i 's/;daemonize = yes/daemonize = no/' /etc/php/7.2/fpm/php-fpm.conf
RUN sed -i 's/listen = \/run\/php\/php7\.2-fpm\.sock/listen = 9000/' /etc/php/7.2/fpm/pool.d/www.conf
EXPOSE 9000

CMD [ "php-fpm7.2" ]
