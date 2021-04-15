#!/bin/bash

CERTS="certs"
mkdir -p $CERTS
PRIVATE_KEY="$CERTS/my"
CERTIFICATE="$CERTS/my"
CERTIFICATE_PUBLIC="$CERTS/my"
CERTIFICATE_PKCS12="$CERTS/my"
PASSWORD="pass.txt"
echo "####################################################"
echo "########### Generando clave privada ################"
echo "####################################################"
if [ ! -f $PASSWORD ]; then
	echo "################# Generando password ###############"
	cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1 > pass.txt
fi
openssl genrsa -passout file:pass.txt -out ${PRIVATE_KEY}.key
echo "####################################################"
echo "########### Generando solicitud de firma ###########"
echo "####################################################"

openssl req -new -key ${PRIVATE_KEY}.key -out ${CERTIFICATE}.csr -subj "/C=CO/ST=Santander/L=Bucaramanga/O=Global Security/OU=IT Department/CN=acme.com"
echo "####################################################"
echo "########### Firmando certificado ###################"
echo "####################################################"

openssl x509 -in ${CERTIFICATE}.csr -out ${CERTIFICATE_PUBLIC}.crt -req -signkey ${PRIVATE_KEY}.key -days 365
echo "####################################################"
echo "########### Obteniendo certificado pkcs12 ##########"
echo "####################################################"
openssl pkcs12 -passout pass:  -export -out ${CERTIFICATE_PKCS12}.pfx -inkey ${PRIVATE_KEY}.key -in ${CERTIFICATE_PUBLIC}.crt
