#!/bin/bash

# Install Docker
echo "#############################"
echo "      Installing Docker"
echo "-----------------------------"
echo ""
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y docker-ce 
sudo usermod -aG docker $(whoami)
sudo systemctl enable docker.service
sudo systemctl start docker.service
echo ""
echo "#############################"

# Install OC/Kubectl
echo "#############################"
echo "  Installing OC and Kubectl  "
echo "-----------------------------"
echo ""
wget https://github.com/openshift/origin/releases/download/v3.11.0/openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit.tar.gz -O openshift-origin.tar.gz
tar -zxf openshift-origin.tar.gz
  chmod +x ./openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit/oc
  sudo mv ./openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit/oc /usr/local/bin/oc
  chmod +x ./openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit/kubectl
  sudo mv ./openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit/kubectl /usr/local/bin/kubectl
rm -rf ./openshift-origin*
echo "installed oc & kubectl"
echo ""
echo "#############################"

# Install Terraform
echo "#############################"
echo "    Installing Terraform     "
echo "-----------------------------"
echo ""
sudo yum install -y unzip
wget https://releases.hashicorp.com/terraform/0.12.5/terraform_0.12.5_linux_amd64.zip
sudo unzip terraform_0.12.5_linux_amd64.zip -d /usr/local/bin/
rm  terraform_0.12.5_linux_amd64.zip
echo ""
echo "#############################"

# Pull terraform git
echo "#############################"
echo " getting openshift terraform "
echo "-----------------------------"
echo ""
cd ~
git clone https://github.com/peterhack/terraform-aws-openshift.git
echo ""
echo "#############################"

# create keypair
echo "#############################"
echo "Creating Keypair for Workshop"
echo "-----------------------------"
echo ""
ssh-keygen -o 
echo ""
echo "#############################"

# Get AWS Credentials

