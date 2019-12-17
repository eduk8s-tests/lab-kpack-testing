#!/bin/bash

# Fill in the address of the local image registry deployed to the project.

cat exercises/sample-java-app.yaml.in | envsubst > exercises/sample-java-app.yaml
