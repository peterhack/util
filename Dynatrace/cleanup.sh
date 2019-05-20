#!/bin/bash
#oc login -u system:admin
oc delete -n dynatrace oneagent --all
oc delete -f https://raw.githubusercontent.com/Dynatrace/dynatrace-oneagent-operator/master/deploy/openshift.yaml
oc delete project dynatrace
