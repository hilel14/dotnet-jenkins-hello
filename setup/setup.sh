#!/bin/bash

# make sure all commands run from the same directory as this script
cd `dirname $0`

# create a custom Jenkins image with Docker tools
docker build -t hilel14/jenkins_with_docker .

# push the custom image to GitHub Hub
docker login
docker image push hilel14/jenkins_with_docker:latest

# deploy Jenkins to k8s cluster
kubectl apply -f jenkins-valumes.yaml
kubectl apply -f jenkins.yaml