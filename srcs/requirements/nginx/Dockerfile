FROM	debian:buster
#COPY	./conf/conf /etc/nginx/conf
RUN		apt update && apt install -y nginx openssl
RUN mkdir /etc/certs/ && openssl genrsa -out /etc/ssl/private/key.pem 4096 && openssl req -new -x509 -sha512 -days 3650 -key /etc/ssl/private/key.pem -out /etc/ssl/certs/cert.pem -subj "/C=FR/ST=France/L=Paris/O=42/OU=42 CN=localhost"

COPY conf/conf /etc/nginx/sites-available/default

RUN chmod 0755 /etc/nginx/sites-available/default

CMD	["/usr/sbin/nginx", "-g", "daemon off;"]
