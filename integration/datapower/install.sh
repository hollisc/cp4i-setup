#!/bin/bash

PROJECT=datapower
RELEASE=$PROJECT-dev

PULL_SECRET=ibm-entitlement-key
LIMITS_CPU=4
LIMITS_MEMORY=8Gi

sed "s/PULL_SECRET/$PULL_SECRET/g"     ./ibm-datapower-icp4i/values_template.yaml  > ./ibm-datapower-icp4i/values_revised_1.yaml
sed "s/LIMITS_CPU/$LIMITS_CPU/g"       ./ibm-datapower-icp4i/values_revised_1.yaml > ./ibm-datapower-icp4i/values_revised_2.yaml
sed "s/LIMITS_MEMORY/$LIMITS_MEMORY/g" ./ibm-datapower-icp4i/values_revised_2.yaml > ./ibm-datapower-icp4i/values.yaml 
rm ./ibm-datapower-icp4i/values_revised_1.yaml
rm ./ibm-datapower-icp4i/values_revised_2.yaml
  
helm install --name $RELEASE --namespace $PROJECT ibm-datapower-icp4i --tls --debug
