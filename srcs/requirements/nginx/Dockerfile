FROM	debian:buster
#COPY	./conf/conf /etc/nginx/conf
RUN		apt update && apt install -y nginx openssl
RUN mkdir -p /var/html/www/wordpress && mkdir /etc/certs/ && openssl genrsa -out /etc/ssl/private/key.pem 4096 && openssl req -new -x509 -sha512 -days 3650 -key /etc/ssl/private/key.pem -out /etc/ssl/certs/cert.pem -subj "/C=FR/ST=France/L=Paris/O=42/OU=42 CN=localhost"

COPY conf/conf /etc/nginx/conf.d/default.conf

RUN chmod 0755 /etc/nginx/conf.d/default.conf

ENTRYPOINT	["/usr/sbin/nginx", "-g", "daemon off;"]
