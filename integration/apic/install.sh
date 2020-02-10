#!/bin/bash
PROJECT=apic
RELEASE=$PROJECT-dev

PRODUCTION_DEPLOY=false
PULL_SECRET=ibm-entitlement-key
# In case of IBM Cloud use ibmc-block-gold for the block storage
BLOCK_STORAGE=rook-ceph-block
# In case of production, it can be set to "standard"
DEPLOY_MODE=dev
ROUTE_TYPE=route
HELM_TLS_SECRET=apic-ent-helm-tls
PROXY_ENDPOINT=$(oc get routes -n kube-system | grep proxy | awk -F' ' '{print $2 }')
# In case of production, it can be set to "3"
REPLICA_COUNT=1
# In case of production, it can be set to "true"
HIGH_PERFORMANCE_PEERING=off

sed "s/PRODUCTION_DEPLOY/$PRODUCTION_DEPLOY/g"               ./ibm-apiconnect-icp4i-prod/values_template.yaml  > ./ibm-apiconnect-icp4i-prod/values_revised_1.yaml
sed "s/PULL_SECRET/$PULL_SECRET/g"                           ./ibm-apiconnect-icp4i-prod/values_revised_1.yaml > ./ibm-apiconnect-icp4i-prod/values_revised_2.yaml
sed "s/BLOCK_STORAGE/$BLOCK_STORAGE/g"                       ./ibm-apiconnect-icp4i-prod/values_revised_2.yaml > ./ibm-apiconnect-icp4i-prod/values_revised_3.yaml
sed "s/DEPLOY_MODE/$DEPLOY_MODE/g"                           ./ibm-apiconnect-icp4i-prod/values_revised_3.yaml > ./ibm-apiconnect-icp4i-prod/values_revised_4.yaml
sed "s/ROUTE_TYPE/$ROUTE_TYPE/g"                             ./ibm-apiconnect-icp4i-prod/values_revised_4.yaml > ./ibm-apiconnect-icp4i-prod/values_revised_5.yaml
sed "s/HELM_TLS_SECRET/$HELM_TLS_SECRET/g"                   ./ibm-apiconnect-icp4i-prod/values_revised_5.yaml > ./ibm-apiconnect-icp4i-prod/values_revised_6.yaml
sed "s/PROXY_ENDPOINT/$PROXY_ENDPOINT/g"                     ./ibm-apiconnect-icp4i-prod/values_revised_6.yaml > ./ibm-apiconnect-icp4i-prod/values_revised_7.yaml
sed "s/REPLICA_COUNT/$REPLICA_COUNT/g"                       ./ibm-apiconnect-icp4i-prod/values_revised_7.yaml > ./ibm-apiconnect-icp4i-prod/values_revised_8.yaml
sed "s/HIGH_PERFORMANCE_PEERING/$HIGH_PERFORMANCE_PEERING/g" ./ibm-apiconnect-icp4i-prod/values_revised_8.yaml > ./ibm-apiconnect-icp4i-prod/values.yaml 
rm ./ibm-apiconnect-icp4i-prod/values_revised_1.yaml
rm ./ibm-apiconnect-icp4i-prod/values_revised_2.yaml
rm ./ibm-apiconnect-icp4i-prod/values_revised_3.yaml
rm ./ibm-apiconnect-icp4i-prod/values_revised_4.yaml
rm ./ibm-apiconnect-icp4i-prod/values_revised_5.yaml
rm ./ibm-apiconnect-icp4i-prod/values_revised_6.yaml
rm ./ibm-apiconnect-icp4i-prod/values_revised_7.yaml
rm ./ibm-apiconnect-icp4i-prod/values_revised_8.yaml

helm install --name $RELEASE --namespace $PROJECT  ibm-apiconnect-icp4i-prod  --tls --debug
