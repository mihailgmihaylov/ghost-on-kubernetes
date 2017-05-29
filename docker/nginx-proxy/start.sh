#!/bin/bash
# Tell nginx the name of the Ghost service to proxy to
sed -i "s/GHOST_SVC/${GHOST_SVC}/g;" /etc/nginx/conf.d/ghost.conf
sed -i "s/CERTBOT_SVC/${CERTBOT_SVC}/g;" /etc/nginx/conf.d/ghost.conf
sed -i "s/HOSTNAME/${HOSTNAME}/g;" /etc/nginx/conf.d/ghost.conf
sed -i "s/HOSTNAME/${HOSTNAME}/g;" /etc/nginx/conf.d/http-redirect.conf
sed -i "s/CERTBOT_SVC/${CERTBOT_SVC}/g;" /etc/nginx/conf.d/http-redirect.conf
sed -i "s/HOSTNAME/${HOSTNAME}/g;" /etc/nginx/conf.d/www.conf

echo "Starting nginx..."
nginx -g 'daemon off;'
