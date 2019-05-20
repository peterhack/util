#!/bin/bash
oc delete projects cicd dev staging production sockshop-registry
oc delete -f ../manifests/oc-scc-hostpath.yml
oc delete -f ../manifests/k8s-jenkins-rbac.yml

