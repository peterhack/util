#!/bin/bash

# installation of OC and Kubectl configuration

# INSTALL OC & KUBECTL
wget https://github.com/openshift/origin/releases/download/v3.11.0/openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit.tar.gz -O openshift-origin.tar.gz
tar -zxf openshift-origin.tar.gz
  chmod +x ./openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit/oc
  sudo mv ./openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit/oc /usr/local/bin/oc
  chmod +x ./openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit/kubectl
  sudo mv ./openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit/kubectl /usr/local/bin/kubectl
rm -rf ./openshift-origin*
echo "installed oc & kubectl"

