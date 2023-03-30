#!/bin/bash

LE_EMAIL="your@mail.com"
RSA_KEY_SIZE=4096

cd "$(dirname "$0")"

docker run -it --rm --name certbot \
    --mount="src=/etc/letsencrypt,target=/etc/letsencrypt,type=bind" \
    --mount="src=/tmp/acme_challenge,target=/tmp/acme_challenge,type=bind" \
    certbot/certbot renew --webroot --webroot-path="/tmp/acme_challenge"

docker compose -f $(pwd)/docker-compose.yml exec nginx-proxy nginx -s reload