FROM ubuntu:xenial

LABEL version="1.0"
LABEL maintainer="mesarpe@gmail.com"

RUN apt-get -y update && \
	apt-get -y install --no-install-recommends \
		qemu-kvm \
		bridge-utils \
		uml-utilities \
		net-tools \
		iproute && \
	rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /app/entrypoint.sh
RUN \
	chmod u+x /app/entrypoint.sh && \
	mkdir /app/img

VOLUME ["/app/img"]
EXPOSE 80/tcp

ENTRYPOINT ["/app/entrypoint.sh"]
