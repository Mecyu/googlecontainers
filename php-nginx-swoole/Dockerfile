FROM webdevops/php-nginx

RUN apt-get update && \
    apt-get install -y php7.2-dev && \
    pecl install swoole && \
    echo "inclde=/opt/docker/etc/php/conf.d/*.ini" > /opt/docker/etc/php/php.ini \
    echo "extension=swoole.so" > /opt/docker/etc/php/conf.d/swoole.ini
