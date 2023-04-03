FROM	debian:buster

RUN apt update; apt install -y curl; curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar ;chmod +x wp-cli.phar;mv wp-cli.phar /usr/local/bin/wp; \
apt update ;\
apt -y install wget \
lsb-release \
apt-transport-https;\
wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg;\
echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list;\
apt update; \
apt install -y mariadb-client;\
test -d /run/php || mkdir -p /run/php && \
test -f /run/php/php7.4-fpm.pid || touch /run/php/php7.4-fpm.pid ;\
apt update;\
apt install php7.4-fpm \
php7.4-common \
php7.4-mysql \
php7.4-mysqli \
php7.4-readline \
php7.4-xml \
php7.4-xsl \
php7.4-xmlrpc \
php7.4-curl \
php7.4-gd \
php7.4-imagick \
php7.4-cli \
php7.4-dev \
php7.4-imap \
php7.4-mbstring \
php7.4-opcache \
php7.4-redis \
php7.4-intl \
php7.4-json \
php7.4-soap \
php7.4-bcmath \
php7.4-zip -y

COPY	./conf/conf.sh /tmp/conf.sh

RUN		chmod 0777 /tmp/conf.sh; sed -i 's/\/run\/php\/php7.4-fpm.sock/9000/g' /etc/php/7.4/fpm/pool.d/www.conf

ENTRYPOINT ["/tmp/conf.sh"]
