# Secure RabbitMQ
This is a simple ssl-enabled RabbitMQ Dockerfile that takes certs generated for unit testing in Apache NiFi, converts them to pem, and uses them as server certs for the RabbitMQ server.

This allows a NiFi to speak to a RabbitMQ server with its test certs.

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
