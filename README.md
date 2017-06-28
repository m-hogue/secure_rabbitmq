# Secure RabbitMQ
This is a simple ssl-enabled RabbitMQ Dockerfile that takes certs generated for unit testing by Apache NiFi and uses them the authenticate between NiFi and RabbitMQ.

This allows a NiFi to publish FlowFiles to a RabbitMQ server with generated test certs.

### RabbitMQ certs (password contained in mikeyo/CN...password):
These were extracted from the p12 in mikeyo/ via the following commands:
```
# extract private key from p12
openssl pkcs12 -in CN\=mikeyo_OU\=NiFi.p12 -nocerts -out mikeyo_priv.pem
# extract public key
openssl pkcs12 -in CN\=mikeyo_OU\=NiFi.p12 -clcerts -nokeys -out mikeyo-pub.pem
```

 - server private key: `mikeyo/mikeyo-priv.pem`
 - server public key: `mikeyo/mikeyo-pub.pem`
 - CA: `mikeyo/nifi-cert.pem`
 
### NiFi SSL Context Service certs (passwords contained in mikeyo/localhost/nifi.properties):
 - client keystore: `mikeyo/localhost/keystore.jks`
 - client truststore: `mikeyo/localhost/truststore.jks`
 
### Instructions
This repo isn't in the docker registry, so to build an image just run the build script `./build.sh`. This builds an image named `rabbitmq-ssl-nifi`.

Once the image is built, you can run the image with the `./docker_run.sh` script. You can watch the logs with the `docker logs rabbit-name -f` command. The -f option tails (or follows) the log.

From there, you can build a NiFi flow with a `GenerateFlowFile` processor and a `PublishAMQP` processor configured to speak to the running RabbitMQ.
