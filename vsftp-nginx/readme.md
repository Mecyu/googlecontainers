# image for vsftpd-nginx server

## usege

docker run -d -p 20:20 -p 21:21 -p 21100-21110:21100-21110 -p 21080:21080 -v /your/path/to/ftp:/home/vsftpd -e FTP_USER=ftpuser -e FTP_PASS=ftppasswd -e PASV_ADDRESS=vsftpd-nginx -e PASV_MIN_PORT=21100 -e PASV_MAX_PORT=21110 -e PASV_ADDR_RESOLVE=YES -e PASV_PROMISCUOUS=YES -e PORT_PROMISCUOUS=YES --name vsftpd-nginx --restart=always mecyu/vsftpd-nginx
