FROM ghost:latest

MAINTAINER Mihail Mihaylov <mihail.georgiev.mihaylov@gmail.com>

COPY entrypoint.sh /entrypoint.sh
RUN chmod u+x /entrypoint.sh

COPY config.js /usr/src/ghost/config-example.js

ENTRYPOINT ["/entrypoint.sh"]

CMD ["npm", "start", "--production"]
