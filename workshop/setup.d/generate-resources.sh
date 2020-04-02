#!/bin/bash

cat exercises/image.yaml.in | envsubst > exercises/image.yaml
cat exercises/secret.yaml.in | envsubst > exercises/secret.yaml
cat exercises/deployment.yaml.in | envsubst > exercises/deployment.yaml
