#! bin/bash

if [ ! -d "/run/php/php7.4-fpm.sock" ]
then
	echo "" > /run/php/php7.4-fpm.sock
fi

mkdir -p /var/www/html/wordpress/adminer; cd /var/www/html/wordpress/adminer; wget -O index.php https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php;

cp /var/www/html/wordpress/adminer/index.php /tmp/index.php

if [ "test -e /var/www/html/wordpress/adminer/index.php" ]
then
	cp /tmp/index.php /var/www/html/wordpress/adminer/index.php
fi

chown -R www-data:www-data /var/www/html/wordpress/adminer

exec /usr/sbin/php-fpm7.4 -F
