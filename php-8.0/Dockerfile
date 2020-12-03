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
    && cat <<EOF >>/etc/nginx/conf.d/app.conf
server {
          listen 8080;
          server_name localhost;
	  location / {
 	     root   /app;
   	      index  index.php index.html index.htm;
	  }
	  location ~* \.php$ {
    	      fastcgi_index   index.php;
              fastcgi_pass    127.0.0.1:9000;
    	      include         fastcgi_params;
    	      fastcgi_param   SCRIPT_FILENAME    $document_root$fastcgi_script_name;
    	      fastcgi_param   SCRIPT_NAME        $fastcgi_script_name;
	  }
}
EOF \
     && cat <<EOF >>/opt/php/run.sh
echo "nginx starting ....\n"
service start nginx
echo "php-fpm starting ....\n"
/usr/local/bin/php-fpm
EOF \
     && chown +x /opt/php/run.sh

WORKDIR /app
CMD /opt/php/run.sh
