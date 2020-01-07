#!/bin/bash

# Fill the namespace in the address of the local image registry.

cat exercises/image.yaml.in | envsubst > exercises/image.yaml

# Fill in the IP address of the local image registry service.

REGISTRY_IP=`kubectl get service/registry -o template --template '{{.spec.clusterIP}}'``
export REGISTRY_IP

cat exercises/deployment.yaml.in | envsubst > exercises/deployment.yaml
