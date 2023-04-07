FROM	debian:buster
RUN		apt update && apt install -y nginx openssl; \
mkdir /etc/certs/ && openssl genrsa -out /etc/ssl/private/key.pem 4096 && openssl req -new -x509 -sha512 -days 3650 -key /etc/ssl/private/key.pem -out /etc/ssl/certs/cert.pem -subj "/C=FR/ST=France/L=Paris/O=42/OU=42 CN=ghanquer.42.fr"

COPY conf/conf /etc/nginx/sites-available/default

COPY conf/adminer /etc/nginx/sites-available/adminer
COPY conf/conf_bonus.sh ./conf_bonus.sh

RUN chmod 0755 /etc/nginx/sites-available/default conf_bonus.sh; \
./conf_bonus.sh

CMD	["/usr/sbin/nginx", "-g", "daemon off;"]
