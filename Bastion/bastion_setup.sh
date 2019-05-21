#!/bin/bash

# Utility configuration

sudo yum -y install wget 

cd ~/util
# INSTALL JQ
wget https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64 -O ~/util/jq
chmod +x ~/util/jq
sudo mv ~/util/jq /usr/local/bin/jq
echo "installed jq"

# INSTALL YQ
wget https://github.com/mikefarah/yq/releases/download/2.3.0/yq_linux_amd64 -O ~/util/yq
chmod +x ~/util/yq
sudo mv ~/util/yq /usr/local/bin/yq
echo "installed yq"

# INSTALL HELM & TILLER
wget https://storage.googleapis.com/kubernetes-helm/helm-v2.14.0-linux-amd64.tar.gz -O ~/util/helm.tar.gz
tar -zxf ~/util/helm.tar.gz 
  chmod +x ~/util/linux-amd64/helm
  sudo mv ~/util/linux-amd64/helm /usr/local/bin/helm
  chmod +x ~/util/linux-amd64/tiller
  sudo mv ~/util/linux-amd64/tiller /usr/local/bin/tiller
rm -rf ~/util/linux-amd64
rm -rf ~/util/helm*
echo "installed helm & tiller"

# INSTALL OC & KUBECTL
wget https://github.com/openshift/origin/releases/download/v3.11.0/openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit.tar.gz -O ~/util/openshift-origin.tar.gz
tar -zxf openshift-origin.tar.gz
  chmod +x ~/util/openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit/oc
  sudo mv ~/util/openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit/oc /usr/local/bin/oc
  chmod +x ~/util/openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit/kubectl
  sudo mv ~/util/openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit/kubectl /usr/local/bin/kubectl
rm -rf ~/util/openshift-origin*
echo "installed oc & kubectl"

# CLONE OPENSHIFT-ANSIBLE REPO
cd ~
  git clone https://github.com/berndonline/openshift-ansible.git
echo "cloned openshift-ansible"  
