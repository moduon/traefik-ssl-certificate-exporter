#!/usr/bin/env bash
/app/traefik-ssl-certificate-exporter --source /app/traefik/acme.json --dest /app/certs/ --owner $CERT_OWNER_ID --group $CERT_GROUP_ID