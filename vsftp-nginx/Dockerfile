FROM fauria/vsftpd
MAINTAINER 649903137@qq.com
COPY ./conf.d/nginx.repo /etc/yum.repos.d/
COPY ./conf.d/default.conf /home/
COPY ./conf.d/run-vsftpd.sh /home/
RUN yum install -y nginx \
    && mv /home/default.conf /etc/nginx/conf.d/default.conf \
    && mv /home/run-vsftpd.sh /usr/sbin/run-vsftpd.sh \
    && nginx -t
