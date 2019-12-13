#!/bin/bash

# Fill in the address of the local image registry deployed to the project.

cat sample-java-app.yaml.in | envsubst > sample-java-app.yaml
