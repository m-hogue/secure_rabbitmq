FROM rabbitmq:management
MAINTAINER Mike Hogue <michael.p.hogue89@gmail.com>

RUN apt-get update \
	&& mkdir -p /home/certs \
	&& chmod 700 /home/certs

COPY rabbitmq.config /etc/rabbitmq/rabbitmq.config
COPY localhost-priv.pem /home/certs
COPY localhost-cert.pem /home/certs
COPY ca.pem /home/certs

RUN rabbitmq-plugins enable rabbitmq_auth_mechanism_ssl --offline

CMD ["rabbitmq-server"]
