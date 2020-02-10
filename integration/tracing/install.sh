#!/bin/bash

PROJECT=tracing
RELEASE=$PROJECT-dev

PULL_SECRET=ibm-entitlement-key 
INGRESS_ENDPOINT=$(oc get routes -n kube-system | grep proxy | awk -F' ' '{print $2 }')
NAVIGATOR_ENDPOINT=$(oc get routes -n integration | grep ibm-icp4i-prod | awk -F' ' '{print $2 }')
# In case of IBM Cloud use ibmc-block-gold for the block storage
BLOCK_STORAGE=rook-ceph-block

sed "s/PULL_SECRET/$PULL_SECRET/g"               ./ibm-icp4i-tracing-prod/values_template.yaml  > ./ibm-icp4i-tracing-prod/values_revised_1.yaml
sed "s/INGRESS_ENDPOINT/$INGRESS_ENDPOINT/g"     ./ibm-icp4i-tracing-prod/values_revised_1.yaml > ./ibm-icp4i-tracing-prod/values_revised_2.yaml
sed "s/NAVIGATOR_ENDPOINT/$NAVIGATOR_ENDPOINT/g" ./ibm-icp4i-tracing-prod/values_revised_2.yaml > ./ibm-icp4i-tracing-prod/values_revised_3.yaml
sed "s/BLOCK_STORAGE/$BLOCK_STORAGE/g"           ./ibm-icp4i-tracing-prod/values_revised_3.yaml > ./ibm-icp4i-tracing-prod/values.yaml 
rm ./ibm-icp4i-tracing-prod/values_revised_1.yaml
rm ./ibm-icp4i-tracing-prod/values_revised_2.yaml
rm ./ibm-icp4i-tracing-prod/values_revised_3.yaml
  
helm install --name $RELEASE --namespace $PROJECT ibm-icp4i-tracing-prod --tls --debug
