FROM ubuntu:20.04

COPY dependencies.json /tmp/dependencies.json

RUN DEBIAN_FRONTEND=noninteractive apt-get update \
 && apt-get install -y --no-install-recommends jq \
 && jq -r 'to_entries | .[] | .key + "=" + .value' /tmp/dependencies.json | xargs apt-get install -y --no-install-recommends \
 && rm /tmp/dependencies.json \
 && apt-get purge -y jq \
 && apt-get clean

RUN sed -i -e 's/^listen = .*$/listen = 0.0.0.0:9000/' /etc/php/7.4/fpm/pool.d/www.conf;
EXPOSE 9000

ENTRYPOINT ["php-fpm7.4","--nodaemonize"]
