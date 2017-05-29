#!/bin/bash

crontab -l > mycron
#echo new cron into cron file

echo "0 2 * * * /run.sh DOMAIN_VALUE EMAIL_VALUE DOMAIN_VALUE http-01" >> mycron #schedule the delete script

#install new cron file
crontab mycron
rm mycron
