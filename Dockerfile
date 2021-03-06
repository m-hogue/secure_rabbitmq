FROM rabbitmq:management
MAINTAINER Mike Hogue <michael.p.hogue89@gmail.com>

RUN apt-get update \
	&& mkdir -p /home/certs/private \
	&& chmod 777 /home/certs/private

COPY rabbitmq.config /etc/rabbitmq/rabbitmq.config
COPY mikeyo/mikeyo-priv.pem /home/certs/private
COPY mikeyo/mikeyo-pub.pem /home/certs
COPY mikeyo/nifi-cert.pem /home/certs

RUN chmod 666 /etc/rabbitmq/*
RUN rabbitmq-plugins enable rabbitmq_auth_mechanism_ssl --offline

CMD ["rabbitmq-server"]
