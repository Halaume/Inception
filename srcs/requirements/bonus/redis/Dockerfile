FROM debian:buster

RUN apt update && apt install -y redis

COPY ./conf/conf.sh /tmp/conf.sh

ENTRYPOINT [ "/tmp/conf.sh" ]
