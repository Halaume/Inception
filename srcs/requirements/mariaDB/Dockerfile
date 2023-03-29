FROM	debian:buster
RUN		apt update && apt install -y mariadb-server mariadb-client
RUN test -d /var/run/mysqld || mkdir -p /var/run/mysqld ; test -d /var/lib/mysql || mkdir -p /var/lib/mysql;
COPY	./conf/conf.sh	/tmp/conf.sh
CMD	bash /tmp/conf.sh
