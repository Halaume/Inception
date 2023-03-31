#! bin/bash

if [ ! -d "/run/php/php7.4-fpm.sock" ]
then
	echo "" > /run/php/php7.4-fpm.sock
fi

while ! mariadb -hmariadb -uChef -pChef "wordpress" &>/dev/null
do
    sleep 1
done

test -d /wordpress || mkdir /wordpress
cd /wordpress; \
	wp core download --allow-root; \
	wp config create --dbhost=mariadb --dbname=wordpress --dbuser=Chef --dbpass=Chef --allow-root; \
	wp core install --url=ghanquer.42.fr --title=Wordpress --admin_user=Chef --admin_password=Chef --admin_email="i@i.com"  --skip-email --allow-root
#exec sleep infinity
exec /usr/sbin/php-fpm7.4 -F
