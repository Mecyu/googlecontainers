#!/bin/bash
echo "nginx starting ....\n"
service start nginx

echo "php-fpm starting ....\n"
/usr/local/bin/php-fpm
