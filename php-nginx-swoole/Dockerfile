FROM webdevops/php-nginx

RUN apt-get update && \
    apt-get install -y php7.2-dev && \
    pecl install swoole && \
    echo "extension=swoole.so" > /opt/docker/etc/php/php.ini && \
    echo "<?php \n echo phpinfo();" > /app/index.php
