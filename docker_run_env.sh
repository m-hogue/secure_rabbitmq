#!/bin/sh

docker run -it -d --hostname my-rabbit \
		--name rabbit-name \
		-p 5671:5671 \
		-p 5672:5672 \
		-p 15672:15672 \
		-e RABBITMQ_SSL_CACERTFILE=/home/certs/ca.pem \
		-e RABBITMQ_SSL_CERTFILE=/home/certs/localhost-cert.pem \
		-e RABBITMQ_SSL_KEYFILE=/home/certs/private/localhost-priv.pem \
		rabbitmq-ssl-nifi
