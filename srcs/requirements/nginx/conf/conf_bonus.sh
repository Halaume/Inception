#! bin/bash

if [ "$BONUS" = "1" ]
then
	mkdir -p /var/www/html/wordpress/adminer;
	ln -s /etc/nginx/sites-available/adminer /etc/nginx/sites-enabled/adminer
else
	rm -rf /var/www/html/wordpress/adminer &> /dev/null;
fi
