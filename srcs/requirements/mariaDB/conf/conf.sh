#! /bin/bash

if [ ! -f "/var/run/mysqld/mysql.sock" ]
then
	echo "" > /var/run/mysqld/mysqld.sock
	chmod 0755 /var/run/mysqld/mysqld.sock
fi

cat <<EOF >init.conf
CREATE DATABASE IF NOT EXISTS ${MARIADB_DATABASE};
CREATE USER IF NOT EXISTS '${MARIADB_USER}'@'%' IDENTIFIED BY '${MARIADB_PASSWORD}';
GRANT ALL PRIVILEGES ON ${MARIADB_DATABASE}.* TO '${MARIADB_USER}'@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}';
FLUSH PRIVILEGES;
EOF

service mysql start 2> /dev/null

while [ [ ! mysqladmin -uroot --password="" status &> /dev/null ] && [ ! mysqladmin -uroot --password="$MARIA_ROOT_PW" status &> /dev/null ] ] ; do sleep 1; done;
sleep 1


mysql --user=root --password="" < init.conf 2> /dev/null

mysqladmin --user=root --password="${MARIADB_ROOT_PASSWORD}" shutdown 2> /dev/null

exec mysqld --bind-address=0.0.0.0
