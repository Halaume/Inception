#! bin/bash

while ! mariadb -hmariadb -uChef -pChef "wordpress" &>/dev/null
do
    sleep 1
done

wp config create --dbhost=mariadb --dbname=wordpress --dbuser=Chef --dbpass=Chef
wp core install --url=127.0.0.1:443 --title=Wordpress --admin_user=Chef --admin_password=Chef
