Lab - Kpack Testing
===================

This is a workshop for testing application deployment using [kpack](https://github.com/pivotal/kpack).

Prerequisites
-------------

In order to use the workshop you should have the eduk8s operator installed.

You must also have the kpack operator installed in the Kubernetes cluster you want to use, and have it managing builds for all namespaces.

For installation instructions for the eduk8s operator see:

* https://github.com/eduk8s/eduk8s-operator

For installation instructions for kpack, see:

* https://github.com/pivotal/kpack

You do not need to set up a global `ClusterBuilder` definition, or namespaces service accounts for this workshop. In other words, for kpack it is generally sufficient to install kpack by running:

```
kubectl apply -f https://github.com/pivotal/kpack/releases/download/v0.0.5/release-0.0.5.yaml
```

Deployment
----------

To deploy the workshop environment run:

```
kubectl apply -k github.com/eduk8s-tests/lab-kpack-testing
```

Then run:

```
kubectl get workshoprequest/lab-kpack-testing
```

This will output the URL to access to workshop environment, as well as the username and password to use when prompted to login to the workshop environment.

You need to be a cluster admin to create the deployment using this method.

Deletion
--------

When you are finished with the workshop environment, you can delete it by running:

```
kubectl delete -k github.com/eduk8s-tests/lab-kpack-testing
```
