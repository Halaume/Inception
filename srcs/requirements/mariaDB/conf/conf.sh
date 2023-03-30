#! /bin/bash

if [ ! -d "/var/lib/mysql/mysql.sock" ]
then
	cat <<EOF >/var/run/mysqld/mysqld.sock
	EOF
fi

cat <<EOF >init.conf
CREATE DATABASE IF NOT EXISTS wordpress
CREATE USER 'Chef'@'localhost' IDENTIFIED BY 'Chef';
CREATE USER 'User'@'localhost' IDENTIFIED BY 'User';
GRANT ALL PRIVILEGES ON wordpress.* TO 'Chef'@'localhost';
FLUSH PRIVILEGES;

EOF

service mysql start

mysql -uroot < init.conf
