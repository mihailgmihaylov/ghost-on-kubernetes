FROM ubuntu:latest
MAINTAINER Mihail Mihaylov <mihail.georgiev.mihaylov@gmail.com>

RUN apt-get update && \
  apt-get install -y letsencrypt && \
  apt-get install -y wget && \
  apt-get install -y cron

RUN \
  wget https://storage.googleapis.com/kubernetes-release/release/v1.3.0/bin/linux/amd64/kubectl && \
  chmod +x kubectl && \
  mv kubectl /usr/local/bin

COPY run.sh /run.sh
COPY add-cron.sh /add-cron.sh
RUN chmod u+x /add-cron.sh /run.sh

EXPOSE 80
EXPOSE 443
CMD [/add-cron.sh]
CMD sleep 86400
