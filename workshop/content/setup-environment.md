As a precondition for running this workshop, the Container Build Service implemented by kpack should have been deployed to the Kubernetes cluster.

To verify whether the required custom resources types exist and can be created, run:

```execute-1
kubectl auth can-i create image.build.pivotal.io
```

Did you type the command in yourself? If you did, click on the command instead and you will find that it is executed for you. You can click on any command which has the <span class="fas fa-running"></span> icon shown to the right of it, and it will be copied to the appropriate interactive terminal and run.

If kpack has been installed correctly and is available to the workshop environment, the result of the above command should have been ``yes``.
