#!/bin/bash

crontab -l > mycron
#echo new cron into cron file

echo "0 2 * * * mysqldump -u root -p$MYSQL_ROOT_PASSWORD --all-databases > /var/lib/mysql/backup/all-databases-\$(date +%u).sql" >> mycron

#install new cron file
crontab mycron
rm mycron
