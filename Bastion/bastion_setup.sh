#!/bin/bash

# Utility configuration
sudo yum update -y 1>/dev/null

# INSTALL wget
if ! [ -x "$(command -v wget)" ]; then
  sudo yum -y install wget 1>/dev/null
  echo ""
  echo "installed wget"
  echo ""
fi

# INSTALL Docker
if ! [ -x "$(command -v docker)" ]; then
  sudo yum -y install docker 1>/dev/null
  sudo service docker start
  sudo usermod -a -G docker ec2-user
  echo ""
  echo "installed docker"
  echo ""
fi

# INSTALL stern
if ! [ -x "$(command -v stern)" ]; then
  cd ~/util
  wget -q https://github.com/wercker/stern/releases/download/1.10.0/stern_linux_amd64 -O ~/util/stern
  chmod +x ~/util/stern
  sudo mv ~/util/stern /usr/local/bin/stern
  echo ""
  echo "installed stern"
  echo ""
fi

# INSTALL JQ
if ! [ -x "$(command -v jq)" ]; then
  cd ~/util
  wget -q https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64 -O ~/util/jq
  chmod +x ~/util/jq
  sudo mv ~/util/jq /usr/local/bin/jq
  echo ""
  echo "installed jq"
  echo ""
fi

# INSTALL YQ
if ! [ -x "$(command -v yq)" ]; then
  cd ~/util
  wget -q https://github.com/mikefarah/yq/releases/download/2.3.0/yq_linux_amd64 -O ~/util/yq
  chmod +x ~/util/yq
  sudo mv ~/util/yq /usr/local/bin/yq
  echo ""
  echo "installed yq"
  echo ""
fi

# INSTALL HELM & TILLER
if ! [ -x "$(command -v helm)" ]; then
  cd ~/util
  wget -q https://storage.googleapis.com/kubernetes-helm/helm-v2.14.0-linux-amd64.tar.gz -O ~/util/helm.tar.gz
  tar -zxf ~/util/helm.tar.gz 
    chmod +x ~/util/linux-amd64/helm
    sudo mv ~/util/linux-amd64/helm /usr/local/bin/helm
    chmod +x ~/util/linux-amd64/tiller
    sudo mv ~/util/linux-amd64/tiller /usr/local/bin/tiller
  rm -rf ~/util/linux-amd64
  rm -rf ~/util/helm*
  echo ""
  echo "installed helm & tiller"
  echo ""
fi

# INSTALL OC & KUBECTL
if ! [ -x "$(command -v oc)" ]; then
  cd ~/util
  wget -q https://github.com/openshift/origin/releases/download/v3.11.0/openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit.tar.gz -O ~/util/openshift-origin.tar.gz
  tar -zxf openshift-origin.tar.gz
    chmod +x ~/util/openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit/oc
    sudo mv ~/util/openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit/oc /usr/local/bin/oc
    chmod +x ~/util/openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit/kubectl
    sudo mv ~/util/openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit/kubectl /usr/local/bin/kubectl
  rm -rf ~/util/openshift-origin*
  echo ""
  echo "installed oc & kubectl"
  echo ""
fi

# INSTALL siege
if ! [ -x "$(command -v siege)" ]; then
  cd ~/util
  wget -q http://download.joedog.org/siege/siege-latest.tar.gz -O ~/util/siege.tar.gz
  tar -zxf ~/util/siege.tar.gz
    cd ~/util/siege*
      ./configure 1>/dev/null 
      make -s 1>/dev/null
      sudo make -s install 1>/dev/null
  rm -rf ~/util/siege*
  echo ""
  echo "installed siege"
  echo ""
fi

# INSTALL kubectx and kubens
if ! [ -x "$(command -v kubectx)" ]; then
  cd ~/util
  git clone -q https://github.com/ahmetb/kubectx
  cd ~/util/kubectx
    sudo mv kubectx /usr/local/bin/kubectx
    sudo mv kubens /usr/local/bin/kubens
  rm -rf ~/util/kubectx
fi

# CLONE OPENSHIFT-ANSIBLE REPO if required Uncomment below
#cd ~
#  git clone https://github.com/berndonline/openshift-ansible.git
#echo "cloned openshift-ansible"  
