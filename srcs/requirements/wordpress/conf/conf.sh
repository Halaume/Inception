#! bin/bash

if [ ! -d "/run/php/php7.4-fpm.sock" ]
then
	echo "" > /run/php/php7.4-fpm.sock
fi

until mysql -hmariadb --user="${MARIADB_USER}" --password="${MARIADB_PASSWORD}" "${MARIADB_DATABASE}" 2> /dev/null; do
	sleep 1
done

test -d /var/www/html/wordpress/wordpress || mkdir -p /var/www/html/wordpress/wordpress

if [ ! -f /var/www/html/wordpress/wordpress/wp-config.php ]
then
	cd /var/www/html/wordpress/wordpress; \
		wp core download --allow-root; \
		wp config create --dbhost=mariadb --dbname=${MARIADB_DATABASE} --dbuser=${MARIADB_USER} --dbpass=${MARIADB_PASSWORD} --allow-root; chmod 0755 wp-config.php; \
		wp core install --url=ghanquer.42.fr --title="${MARIADB_DATABASE}" --admin_user=${MARIADB_USER} --admin_password=${MARIADB_PASSWORD} --admin_email="${MARIADB_ROOT_MAIL}"  --skip-email --allow-root
		wp user create ${WORDPRESS_DB_USER} ${WORDPRESS_DB_USER}@mail.com --user_pass=${WORDPRESS_DB_PASSWORD} --role=editor --allow-root &> /dev/null; \
		sed -i "s/<?php/<?php\ndefine( 'WP_REDIS_CLIENT', 'phpredis' );\ndefine( 'WP_REDIS_HOST', 'redis' );\ndefine( 'WP_REDIS_PORT', 6379 );\ndefine( 'WP_REDIS_PASSWORD', '${REDIS_PW}' );\ndefine( 'WP_REDIS_DATABASE', 0 );\n/" "wp-config.php";
fi

if [ ${BONUS} ]
then
	cd /var/www/html/wordpress/wordpress;\
	wp plugin install redis-cache --activate --allow-root; \
	wp redis enable --allow-root
else
	cd /var/www/html/wordpress/wordpress; wp plugin deactivate redis-cache --uninstall --allow-root
fi

chown -R www-data:www-data /var/www/html/wordpress/wordpress
chown -R www-data:www-data /var/www/html/wordpress

echo "Wordpress Done"
exec /usr/sbin/php-fpm7.4 -F
