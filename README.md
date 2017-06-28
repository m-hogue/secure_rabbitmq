# Secure RabbitMQ
This is a simple ssl-enabled RabbitMQ Dockerfile that takes certs generated for unit testing in Apache NiFi, converts them to pem, and uses them as server certs for the RabbitMQ server.

This allows a NiFi to speak to a RabbitMQ server with its test certs.
