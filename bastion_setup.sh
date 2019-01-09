#!/bin/bash
# Dynatrace OneAgent Operator
# git clone https://github.com/dynatrace/dynatrace-oneagent-operator.git
# mv ./apply.sh ./dynatrace-oneagent-operator/deploy/apply.sh
# mv ./cleanup.sh ./dynatrace-oneagent-operator/deploy/cleanup.sh

# Utility configuration
sudo ~/util/hub-linux-amd64-2.6.0/install
sudo mv ~/util/jq-linux64 /usr/sbin/jq
echo ""
read -p "Please enter your Github Username: " GITU
read -p "Please enter your Github Organization: " GITO
echo ""
echo "Github Username: " $GITU
echo "Github Organization: " $GITO
read -p "Is this all correct?" -n 1 -r
echo ""

if [[ $REPLY =~ ^[Yy]$ ]]
then
# bring local the provisioning scripts
  git config --global credential.helper cache
  git config --global credential.https://github.com.$GITU $GITO
  git clone https://$GITU@github.com/dt-toronto-acm/provision-acm-openshift.git ~/provision-acm-openshift
  cd ~
    ~/provision-acm-openshift/scripts/forkGitHubRepositories.sh $GITO 
fi
# mv ./creds.sav ./provision-acm-openshift/scripts/creds.json
# mv ./cleanJenkins.sh ./provision-acm-openshift/scripts/cleanJenkins.sh

# log into the OpenShift cluster
echo ""
echo "Please log into your OpenShift cluster"
oc login https://master1:443

# make bastion_setup.sh non-executable once completed
chmod 666 ~/util/bastion_setup.sh
