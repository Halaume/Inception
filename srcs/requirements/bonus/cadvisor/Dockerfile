FROM	debian:buster

RUN apt update && apt upgrade -y && apt install -y wget tar git gcc make;\
	wget https://go.dev/dl/go1.19.linux-amd64.tar.gz; \
	tar -C /usr/local -xzf go1.19.linux-amd64.tar.gz; \
	echo "export PATH=$PATH:/usr/local/go/bin" >> /etc/profile; \
	echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.bashrc; \
	mkdir /go;
ENV GOPATH /go
ENV PATH $PATH:/usr/local/go/bin:$GOPATH/bin
RUN cd /usr/local/go/src; \
	git clone https://github.com/google/cadvisor.git cadvisor; \
	cd cadvisor; \
	make -j build; \
	cp _output/cadvisor /usr/local/bin; \
	chmod 0777 /usr/local/bin/cadvisor;

CMD ["cadvisor"]
