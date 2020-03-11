As a precondition for running this workshop, the Container Build Service implemented by kpack should have been deployed to the Kubernetes cluster.

The build service consists of a Kubernetes operator, and a set of custom resources types which are used to define and run builds.

To verify that the required custom resources types exist run:

```execute-1
kubectl api-resources --api-group build.pivotal.io -o name
```

Did you type the command in yourself? If you did, click on the command instead and you will find that it is executed for you. You can click on any command which has the <span class="fas fa-running"></span> icon shown to the right of it, and it will be copied to the appropriate interactive terminal and run.

The output from the command should be:

```
builders.build.pivotal.io
builds.build.pivotal.io
clusterbuilders.build.pivotal.io
images.build.pivotal.io
sourceresolvers.build.pivotal.io
```

To verify that you are able to create resource objects of these types run:

```execute-1
kubectl auth can-i create image.build.pivotal.io
```

If kpack has been installed correctly and is available to the workshop environment, the result of the above command should have been ``yes``.

For your workshop session, a local instance of a container image registry has also been deployed to the project namespace you are working in. This will be used to hold the container images created by the build service.

To verify that the image registry is deployed and running, run:

```execute-1
kubectl rollout status deployment/registry
```

When the registry is up and running, this should display:

```
deployment "registry" successfully rolled out
```
