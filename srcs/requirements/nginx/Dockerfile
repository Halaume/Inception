FROM	debian:buster
#COPY	./conf/conf /etc/nginx/conf
RUN		apt update && apt install -y nginx
CMD	["/usr/sbin/nginx", "-g", "daemon off;"]
