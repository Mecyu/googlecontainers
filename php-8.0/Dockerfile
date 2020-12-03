FROM ubuntu:latest

MAINTAINER 649903137@qq.com

RUN apt-get update \
    && apt-get install -y gcc pkg-config libxml2 libxml2-dev libsqlite3-dev libcurl4-openssl-dev zlib1g-dev libpng-dev libonig-dev wget automake autoconf libtool make nginx \
    && mkdir /opt/php && cd /opt/php \
    && wget https://www.php.net/distributions/php-8.0.0.tar.gz \
    && tar zxf php-8.0.0.tar.gz && cd php-8.0.0 \
    && ./configure --enable-fpm --with-mysqli --with-pdo-mysql --enable-mbstring --enable-gd --with-curl \
    && make && make install \
    && mkdir /app && echo "<?php \n echo phpinfo();" > /app/index.php \
    && cp /app.conf /etc/nginx/conf.d/ && cp /run.sh /opt/php/ \
    && chown +x /opt/php/run.sh

WORKDIR /app
CMD /opt/php/run.sh
