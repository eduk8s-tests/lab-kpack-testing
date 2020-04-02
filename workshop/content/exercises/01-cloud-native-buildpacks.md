**Note this is very much work in progress and is just a snapshot of commands required to test use of kpack. A lot more work needs to be done to complete the workshop. The workshop will only work when deployed under the training portal and with secure ingress.**

Before starting, change to the ``exercises`` sub directory. This contains files you will need to perform the exercises.

```execute-1
cd exercises
```

Check what files are in the directory by running:

```execute-1
ls -las
```

The first file in this directory we need to use is ``builder.yaml``. View the contents of the file by running:

```execute-1
cat builder.yaml
```

This informs kpack what set of buildpacks to apply to builds. Often this would be defined cluster wide using a ``ClusterBuilder`` resource. We will create a ``Builder`` resource local to the namespace you are working in. To apply the ``Builder`` resource, run:

```execute-1
kubectl apply -f builder.yaml
```

The command should output:

```
builder.build.pivotal.io/builder created
```

Next we need to create a service account in your namespace which builds will be run as. To do that run:

```execute-1
kubectl create serviceaccount kpack-builder
```

Builds run as this service account will need to have access to an image registry into which to store build artefacts and the final application image.

For this workshop, an image registry has been deployed for you. The credentials for accessing this image registry are stored in the file ``$HOME/.docker/config.json``. To view the contents run:

```execute-1
cat $HOME/.docker/config.json
```

To make these credentials available to the service account, they first need to be packaged up as a secret.

```execute-1
kubectl create secret generic registry-credentials --from-file=.dockerconfigjson=$HOME.docker/config.json --type=kubernetes.io/dockerconfigjson
```

The builder service account then needs to be linked to the secret containing the credentials.

```execute-1
kubectl patch serviceaccount/kpack-builder -p '{"secrets":[]{"name":"registry-credentials"}]}'
```

To set up the build, we now need to create an ``Image`` resource. This tells kpack about the source code for our application and which builder definition to use to work out how to build it. To view the ``Image`` definition in the current directory, run:

```execute-1
cat image.yaml
```

You will see that it contains:

```
builder:
  name: builder
  kind: Builder
```

This is telling kpack to use the local ``Builder`` you defined above.

The location of your application source code is defined by:

```
source:
  git:
    url: https://github.com/buildpack/sample-java-app
    revision: master
```

The service account the build runs as is defined by:

```
serviceAccount: kpack-builder
```

and, the image registry to which to push the results, and the name of the image, are defined by:

```
tag: %session_namespace%-registry.%ingress_domain%/sample-java-app
```

This definition has been automatically filled out with the address of the local image registry deployed to the namespace you are working in.

To setup and run the initial image build, run:

```execute-1
kubectl apply -f image.yaml
```

This will take some time to build the first time. You can monitor progress by running the kpack ``logs`` command.

```execute-1
logs --namespace %session_namespace% --image sample-java-app
```

When the build has completed and the logs show:

```
Build successful
```

interrupt the tailing of the logs:

```execute-1
<ctrl-c>
```

At this point the built image has been uploaded to the local image registry. You can inspect details of the image by running:

```execute-1
skopeo inspect docker://$SESSION_NAMESPACE-registry.${INGRESS_DOMAIN}/sample-java-app
```

The set of resources to deploy the image can be viewed by running:

```execute-1
cat deployment.yaml
```

The ``image`` field for the container references the local image registry. Note, that the IP of the image registry is used as lookup by DNS for the service name of the image registry will not usually work in a typical Kubernetes cluster in this case.

Deploy the application using the image by running:

```execute-1
kubectl apply -f deployment.yaml
```

Monitor the deployment using:

```execute-1
kubectl rollout status deployment/sample-java-app
```

When the deployment is complete, you can test access by running:

```execute-1
curl http://sample-java-app.%session_namespace%.svc.cluster.local:8080
```

Keep trying this command as it may take a few moments for the Java application to start up.

You can also test access from your browser by visiting:

* http://%session_namespace%-app.%ingress_domain%
