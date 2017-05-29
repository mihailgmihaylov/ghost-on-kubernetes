FROM mysql

MAINTAINER Mihail Mihaylov <mihail.georgiev.mihaylov@gmail.com>

RUN apt-get update && apt-get install -y cron

COPY cron.sh /cron.sh
RUN chmod u+x /cron.sh

EXPOSE 3306
CMD /cron.sh && mysqld
