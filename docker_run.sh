#!/bin/sh

docker run -it -d --hostname my-rabbit \
		--name rabbit-name \
		-p 5671:5671 \
		-p 5672:5672 \
		-p 15672:15672 \
		-e RABBITMQ_SSL_CACERTFILE=/home/certs/nifi-cert.pem \
		-e RABBITMQ_SSL_CERTFILE=/home/certs/mikeyo-pub.pem \
		-e RABBITMQ_SSL_KEYFILE=/home/certs/private/mikeyo-priv.pem \
		rabbitmq-ssl-nifi
