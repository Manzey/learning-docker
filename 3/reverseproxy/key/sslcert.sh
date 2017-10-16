#! /bin/sh

echo "Generating self-signed certificates..."
mkdir /etc/ssl/private/
mkdir /etc/ssl/certs/
openssl genrsa -out /etc/ssl/private/key.pem 4096
openssl req -new -key /etc/ssl/private/key.pem -out /etc/ssl/certs/csr.pem
openssl x509 -req -days 365 -in /etc/ssl/certs/csr.pem -signkey /etc/ssl/private/key.pem -out /etc/ssl/certs/cert.pem
rm /etc/ssl/certs/csr.pem
chmod 600 /etc/ssl/private/key.pem /etc/ssl/certs/cert.pem