# image for php-nginx with redis,swoole,supervisor,mysqld_pdo ... extensions
## usege
docker pull mecyu/php72-nginx

docker run --name=php-nginx -p 8080:80 -d mecyu/php72-nginx

copy localhost:8080 into your browser
