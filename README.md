# .NET Jenkins Hello-World Exercise

## Overview

This Git project contains the resources and instructions needed to setup and run a demo, using Jenkins to build a .NET WebApp and deploy it to a K8S cluster. It was tested on a Linux work-station (Ubuntu 22.04.3 LTS), with Docker (version 24.0.7) and Minikube (version 1.30.1)

## Steps to recreate the exercise

* Run script `setup/setup.sh` to create a custom Jenkins Docker image and deploy it as K8S service.
* Perform some Jenkins post-installation tasks:
  * Access Jenkis controller from your browser at: http://${node_ip}:32000 and login as Administrator
  * Install suggested plugins and add admin user
  * Add Docker Hub Credentials to Jenkins
  * Create a new Pipeline project. Important configuration:
    * Pipeline script from SCM
    * Repository URL: https://github.com/hilel14/dotnet-jenkins-hello
    * Branch Specifier: */*
* Trigger the build manually
* Access the deployed applications at http://${node_ip}:???

## Remarks

This exercise contains some shortcuts and workarounds that are not relevant to a real production environment.

* In a real environment, we need to configure a webhook in our Git repository, in order to trigger our build very time a user pushes changes to the project.
* Jenkins should use a dedicated worker node for building, instead of using the Jenkins controller's built-in node.
* Jenkins controller should use Persistant volume to save configuration.

## Useful Links

* https://github.com/scriptcamp/kubernetes-jenkins
* https://hackmamba.io/blog/2022/04/running-docker-in-a-jenkins-container/