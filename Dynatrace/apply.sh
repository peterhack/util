#!/bin/bash
# The following script is to simplify the deployment of the Dynatrace OneAgent operator
# 3 variables are required and can be exported as environment variables:
# - apiToken    (example: /> export DTAPI="apiToken=1234567890abcdefghijlkmn")
# - paasToken   (example: /> export DTPAAS="passToken=1234567890abcdefghijklmn")
# - ENVIRONMENTID (example: /> export DTENV="abc12345.dynatrace.live.com"
#                --for Managed-- /> export DTENV="host_url/e/environmentid")
echo "you require the following details to continue:"
echo ""
echo "Dynatrace Environment ID (example abc12345)"
echo "Dynatrace API Token"
echo "Dynatrace PaaS Token"
echo ""

read -p "Is this a SaaS tenant? (y/n) " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
  if [ -z "$DTENV" ]; then
    read -p "Please enter your Dynatrace Environment ID: " DTENV
    echo ""
  fi
else
  read -p "Please enter the full URL of your tenant:" DTENV
  FULLURL=true
  echo ""
fi
  
if [ -z "$DTAPI" ]; then
  read -p "Please enter your Dynatrace API Token: " DTAPI
  echo ""
fi

if [ -z "$DTPAAS" ]; then
  read -p "Please enter your Dynatrace PaaS Token: " DTPAAS
  echo ""
fi

echo ""
echo "Dynatrace Environment ID: " $DTENV
echo "Dynatrace API Token:      " $DTAPI
echo "Dynatrace PaaS Token:     " $DTPAAS
echo ""
read -p "Is this all correct?" -n 1 -r
echo ""

if [[ $REPLY =~ ^[Yy]$ ]]; then
  if [ $(oc get namespace | grep dynatrace | wc -l) == 0 ];
  then
    oc adm new-project --node-selector="" dynatrace  
  if [ -z "$FULLURL" ]; then
    sed -i 's/ENVIRONMENTID/'"$DTENV"'/' cr.yaml
  else
    sed -i 's~ENVIRONMENTID.live.dynatrace.com~'"$DTENV"'~' cr.yaml
  fi
  oc create -f openshift.yaml
  oc -n dynatrace create secret generic oneagent --from-literal="apiToken=$DTAPI" --from-literal="paasToken=$DTPAAS"
  oc create -f ./cr.yaml
  fi
fi
