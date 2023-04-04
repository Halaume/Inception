#! bin/bash

if [ ! -d "/run/php/php7.4-fpm.sock" ]
then
	echo "" > /run/php/php7.4-fpm.sock
fi

until mysql -hmariadb --user="${MARIADB_USER}" --password="${MARIADB_PASSWORD}" "${MARIADB_DATABASE}" 2> /dev/null; do
	sleep 1
done

test -d /var/www/html/wordpress || mkdir -p /var/www/html/wordpress

if [ ! -f /var/www/html/wordpress/wp-config.php ]
then

cd /var/www/html/wordpress; \
	wp core download --allow-root; \
	wp config create --dbhost=mariadb --dbname=${MARIADB_DATABASE} --dbuser=${MARIADB_USER} --dbpass=${MARIADB_PASSWORD} --allow-root; chmod 0755 wp-config.php; \
	wp core install --url=ghanquer.42.fr --title="${MARIADB_DATABASE}" --admin_user=${MARIADB_USER} --admin_password=${MARIADB_PASSWORD} --admin_email="${MARIADB_ROOT_MAIL}"  --skip-email --allow-root
fi

chown -R www-data:www-data /var/www/html/wordpress

#exec sleep infinity
echo "Wordpress Done"
exec /usr/sbin/php-fpm7.4 -F
