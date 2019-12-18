This workshop provides an introduction into building application container images using Cloud Native Buildpacks, in Kubernetes, using [kpack](https://github.com/pivotal/kpack).

The [buildpacks.io](https://buildpacks.io/) web site provides the following history of Cloud Native Buildpacks.

> Buildpacks were first conceived by Heroku in 2011. Since then, they have been adopted by Cloud Foundry and other PaaS such as Gitlab, Knative, Deis, Dokku, and Drie.</br></br>
> The Cloud Native Buildpacks project was initiated by Pivotal and Heroku in January 2018 and joined the Cloud Native Sandbox in October 2018. The project aims to unify the buildpack ecosystems with a platform-to-buildpack contract that is well-defined and that incorporates learnings from maintaining production-grade buildpacks for years at both Pivotal and Heroku.</br></br>
> Cloud Native Buildpacks embrace modern container standards, such as the OCI image format. They take advantage of the latest capabilities of these standards, such as cross-repository blob mounting and image layer "rebasing" on Docker API v2 registries.

The kpack project implements a Kubernetes Native Container Build Service, extending Kubernetes using operators and utilizing Kubernetes primitives to provide builds of OCI images as a platform implementation of Cloud Native Buildpacks (CNB).
