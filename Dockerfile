FROM rabbitmq:management
MAINTAINER Mike Hogue <michael.p.hogue89@gmail.com>

RUN apt-get update \
	&& mkdir -p /home/certs \
	&& chmod 700 /home/certs

COPY rabbitmq.config /etc/rabbitmq/rabbitmq.config
COPY localhost-priv.pem /home/certs
COPY localhost-cert.pem /home/certs
COPY cacert.pem /home/certs

run /bin/bash rabbitmq-server
