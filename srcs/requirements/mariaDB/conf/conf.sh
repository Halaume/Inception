#! /bin/bash

if [ ! -d "/var/run/mysql/mysql.sock" ]
then
	echo "" > /var/run/mysqld/mysqld.sock
fi

cat <<EOF >init.conf
CREATE DATABASE IF NOT EXISTS wordpress;
CREATE USER IF NOT EXISTS 'Chef'@'%' IDENTIFIED BY 'Chef';
GRANT ALL PRIVILEGES ON wordpress.* TO 'Chef'@'%';
FLUSH PRIVILEGES;
EOF

service mysql start

sleep 1

mysql --user=root --password="" < init.conf

mysqladmin shutdown

exec mysqld --bind-address=0.0.0.0
