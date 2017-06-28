#!/bin/bash

IMAGE_NAME="rabbitmq-ssl-nifi"

docker build --no-cache=true -t $IMAGE_NAME .
