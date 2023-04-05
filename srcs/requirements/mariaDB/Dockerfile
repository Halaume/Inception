FROM	debian:buster
RUN		apt update && apt install -y mariadb-server;
RUN test -d /var/run/mysqld || mkdir -p /var/run/mysqld; test -d /var/lib/mysql || mkdir -p /var/lib/mysql; chmod 0755 /var/run/mysqld; chown mysql:mysql /var/run/mysqld;
COPY	./conf/conf.sh	/tmp/conf.sh
RUN chmod 0755 /tmp/conf.sh
ENTRYPOINT	["/tmp/conf.sh"]
