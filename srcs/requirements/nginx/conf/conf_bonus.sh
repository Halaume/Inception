#! bin/bash

if [ ${BONUS} ]
then
	mkdir -p /var/www/html/wordpress/adminer;
	ln -s /etc/nginx/sites-available/adminer /etc/nginx/sites-enabled/adminer
	mkdir /etc/ssl/certs/adminer; openssl genrsa -out /etc/ssl/private/adminerkey.pem 4096 && openssl req -new -x509 -sha512 -days 3650 -key /etc/ssl/private/adminerkey.pem -out /etc/ssl/certs/adminer/cert.pem -subj "/C=FR/ST=France/L=Paris/O=42/OU=42 CN=ghanquer.42.fr"
	echo "Bonux"
else
	echo "Pas Bonux"
	rm -rf /var/www/html/wordpress/adminer &> /dev/null;
	rm -rf /etc/nginx/sites-available/adminer &> /dev/null;
	rm -rf /etc/nginx/sites-enabled/adminer &> /dev/null;
fi
