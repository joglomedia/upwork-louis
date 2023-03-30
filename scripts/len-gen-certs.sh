#!/bin/bash

LE_EMAIL="your@mail.com"
RSA_KEY_SIZE=4096

docker run -it --rm -p 443:443 -p 80:80 --name certbot \
    --mount="src=/etc/letsencrypt,target=/etc/letsencrypt,type=bind" \
    --mount="src=/tmp/acme_challenge,target=/tmp/acme_challenge,type=bind" \
    certbot/certbot certonly --webroot --webroot-path="/tmp/acme_challenge" \
    -d dc.masedi.net -d dc2.masedi.net \
    --text --agree-tos --email="${LE_EMAIL}" --rsa-key-size="${RSA_KEY_SIZE}" \
    --verbose --keep-until-expiring --preferred-challenges=http
