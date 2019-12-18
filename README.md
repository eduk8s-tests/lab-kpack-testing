Lab - Kpack Testing
===================

This is a workshop for testing application deployment using [kpack](https://github.com/pivotal/kpack).

Prerequisites
-------------

In order to use the workshop, kpack must already have been installed in the Kubernetes cluster you want to use, and be managing builds for all namespaces.

For installation instructions for kpack, see:

* https://github.com/pivotal/kpack

You do not need to set up a global `ClusterBuilder` definition, or namespaces service accounts for this workshop. In other words, it is generally sufficient to install kpack by running:

```
kubectl apply -f https://github.com/pivotal/kpack/releases/download/v0.0.5/release-0.0.5.yaml
```

Deployment
----------

To deploy the workshop environment run:

```
kubectl apply -k github.com/eduk8s-tests/lab-kpack-testing
```

This will deploy the workshop environment, as well as an image registry, in the namespace `lab-kpack-testing`.

Access
------

The workshop environment is not exposed outside of the cluster. To access the workshop environment, first setup up port forwarding to your local machine.

```
kubectl port-forward svc/workshop 10080:10080 -n lab-kpack-testing
```

Then access the workshop environment at:

```
http://localhost:10080
```

Do not open up access to the workshop environment outside of your local machine.

Deletion
--------

When you are finished with the workshop environment, you can delete it by running:

```
kubectl delete -k github.com/eduk8s-tests/lab-kpack-testing
```

This will delete the `lab-kpack-testing` namespace.
