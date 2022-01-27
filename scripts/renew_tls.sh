#!/usr/bin/env bash
#/usr/bun/env bash haha

if [[ -z "$1" ]]; then
  echo "no domain in first position. renew_tls failing"
  exit 1
fi

if [[ -z "$2" ]]; then
  echo "no user in second position. renew_tls failing"
  exit 1
fi

sudo certbot renew --quiet
mkdir -p /home/$2/sslcerts
sudo -u root cp_certs $1 /home/$2/sslcerts/
sudo chown $2:$2 /home/$2/sslcerts/*


