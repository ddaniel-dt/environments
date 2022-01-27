#!/usr/bin/env bash


if [[ -z "$1" ]]; then
  echo "no domain in first position. tls_renew failing"
  exit 1
fi

if [[ -z "$2" ]]; then
  echo "no user in second position. tls_renew failing"
  exit 1
fi

sudo cp ./renew_tls.sh /root/
# add our job to crontab if it's not there already
(sudo crontab -l | grep "tls_renew.sh $1") || ( sudo crontab -l; echo "0 12 * * * /root/tls_renew.sh $1 $2"; ) | sudo crontab

# test, runs every 2 minutes haha
#(sudo crontab -l | grep "tls_renew.sh $1") || ( sudo crontab -l; echo "*/2 * * * * /root/tls_renew.sh $1 $2"; ) | sudo crontab

