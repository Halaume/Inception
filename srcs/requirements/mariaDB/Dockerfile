FROM	debian:buster
RUN		apt update && apt install -y mariadb-server mariadb-client
RUN test -d /var/run/mysqld || mkdir -p /var/run/mysqld ; test -d /var/lib/mysql || mkdir -p /var/lib/mysql;
COPY	./conf/conf.sh	/tmp/conf.sh
COPY	./conf/my.cnf	/tmp/my.cnf
RUN ln -s /var/lib/mysqld/mysqld.sock /var/run/mysqld/mysqld.sock
RUN chmod -R 755 /var/run/mysqld
RUN chmod  755 /tmp/my.cnf
CMD	bash /tmp/conf.sh
