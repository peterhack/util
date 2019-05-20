#!/bin/bash

# Utility configuration

sudo yum install wget 

# INSTALL JQ
wget https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64 -O ~/util/jq
sudo mv ~/util/jq-linux64 /usr/local/bin/jq
echo "installed jq"

# INSTALL YQ
wget https://github.com/mikefarah/yq/releases/download/2.3.0/yq_linux_amd64 -O ~/util/yq
sudo mv ~/util/yq /usr/local/bin/yq
echo "installed yq"

# INSTALL HELM & TILLER
wget https://storage.googleapis.com/kubernetes-helm/helm-v2.14.0-linux-amd64.tar.gz -O ~/util/helm.tar.gz
tar -zxf helm.tar.gz
  sudo mv ~/util/linux-amd64/helm /usr/local/bin/helm
  sudo mv ~/util/linux-amd64/tiller /usr/local/bin/tiller
rm -rf ~/util/linux-amd64
rm -rf ~/util/helm*
echo "installed helm & tiller"

# INSTALL OC & KUBECTL
wget 
wget https://github.com/openshift/origin/releases/download/v3.11.0/openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit.tar.gz -O ~/util/openshift-origin.tar.gz
tar -zxf openshift-origin.tar.gz
  sudo mv ~/util/openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit/oc /usr/local/bin/oc
  sudo mv ~/util/openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit/kubectl /usr/local/bin/kubectl
rm -rf ~/util/openshift-origin*
echo "installed oc & kubectl"

# CLONE OPENSHIFT-ANSIBLE REPO
git clone https://github.com/berndonline/openshift-ansible.git
echo "cloned openshift-ansible"  

# MAKE BASTION LOCAL CLUSTER ADMIN
mkdir ~/.kube
scp master1:~/.kube/config ~/.kube/config
echo "made bastion a local cluster admin"
