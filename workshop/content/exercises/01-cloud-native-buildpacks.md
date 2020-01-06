**Note this is very much work in progress and is just a snapshot of commands required to test use of kpack. A lot more work needs to be done to complete the workshop.**

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

Normally when using kpack you need to create a secret with the credentials for the image registry where built images will be stored. In this workshop environment an image registry has been deployed into the namespace used by your workshop session. This image registry has no access controls set up, so credentials are not required. We will therefore skip creation of the secret.

Next we need to create a service account in your namespace which builds will be run as. To do that run:

```execute-1
kubectl create serviceaccount kpack-builder
```

If you did have a secret, you would need to create the service account from a raw resource definition, or patch it after it was created, to add the appropriate reference to the secret in it.

To set up a build, we now need to create an ``Image`` resources. This tells kpack about the source code for our application and which builder definition to use to work out how to build it. To view the ``Image`` definition in the current directory, run:

```execute-1
cat sample-java-app.yaml
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
tag: registry.%session_namespace%.svc.cluster.local/sample-java-app
serviceAccount: kpack-builder
```

This definition has been automatically filled out with the address of the local image registry deployed to the namespace you are working in.

To setup and run the initial image build, run:

```execute-1
kubectl apply -f sample-java-app.yaml
```

This will take some time to build the first time. You can monitor its progress by the kpack ``logs`` command.

```execute-1
logs --namespace %session_namespace% --image sample-java-app
```

**We are going to stop here for the moment as is enough to demonstrate eduk8s, which is the purpose of the test workshop at present.**
