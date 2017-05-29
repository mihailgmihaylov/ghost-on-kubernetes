FROM nginx

MAINTAINER Mihail Mihaylov <mihail.georgiev.mihaylov@gmail.com>

#RUN echo "deb http://ftp.debian.org/debian jessie-backports main" >> /etc/apt/sources.list && \
#apt-get update && \
#apt-get install -y certbot -t jessie-backports

COPY ghost.conf /etc/nginx/conf.d/ghost.conf
COPY http-redirect.conf /etc/nginx/conf.d/http-redirect.conf
COPY www.conf /etc/nginx/conf.d/www.conf

COPY start.sh /
RUN chmod u+x /start.sh

ENTRYPOINT ./start.sh
