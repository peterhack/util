#!/bin/bash

oc delete -f ~/keptn/install/manifests/ocp/oc-scc-hostpath.yml
oc delete -f ~/keptn/install/manifests/k8s-namespaces.yml
oc delete namespace sockshop-registry
oc delete serviceaccount pusher
oc delete -f ~/keptn/install/manifests/jenkins/k8s-jenkins-rbac.yml
oc delete -f ~/keptn/install/manifests/ocp/oc-imagestreams.yml
LATEST_RELEASE=$(curl -s https://api.github.com/repos/dynatrace/dynatrace-oneagent-operator/releases/latest | grep tag_name | cut -d '"' -f 4)
oc delete -f https://raw.githubusercontent.com/Dynatrace/dynatrace-oneagent-operator/$LATEST_RELEASE/deploy/openshift.yaml
oc delete namespace dynatrace
oc delete -f ~/keptn/install/manifests/ansible-tower/namespace.yml
