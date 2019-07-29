#!/bin/bash

sudo yum install -y unzip
wget https://releases.hashicorp.com/terraform/0.12.5/terraform_0.12.5_linux_amd64.zip
sudo unzip terraform_0.12.5_linux_amd64.zip -d /usr/local/bin/
echo "$(terraform -v) Installed" 
rm terraform_0.12.5_linux_amd64.zip
