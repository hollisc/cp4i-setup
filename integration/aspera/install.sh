#!/bin/bash

PROJECT=aspera
RELEASE=$PROJECT-dev

PRODUCTION_DEPLOY=false
USE_DYNAMIC_PROVISIONING=true
# In case of IBM Cloud use ibmc-file-gold for the file storage
FILE_STORAGE="nfs"
REPOSITORY=cp.icr.io/cp/icp4i/aspera
PULL_SECRET=ibm-entitlement-key
PROXY_ENDPOINT=$(oc get routes -n kube-system | grep proxy | awk -F' ' '{print $2 }')
# In case of HA env, it can be set to 3
REPLICAS=1
SERVER_SECRET=aspera-server
NODE_ADMIN_SECRET=asperanode-nodeadmin
ACCESSKEY_SECRET=asperanode-accesskey
KAFKAPORT=30999
ASCP_NODE_LABEL={-node-role.kubernetes.io/ascp: "true"}
NODED_NODE_LABEL={-node-role.kubernetes.io/noded: "true"}

sed "s/PRODUCTION_DEPLOY/$PRODUCTION_DEPLOY/g"               ./ibm-aspera-hsts-icp4i/values_template.yaml  > ./ibm-aspera-hsts-icp4i/values_revised_1.yaml
sed "s/USE_DYNAMIC_PROVISIONING/$USE_DYNAMIC_PROVISIONING/g" ./ibm-aspera-hsts-icp4i/values_revised_1.yaml > ./ibm-aspera-hsts-icp4i/values_revised_2.yaml
sed "s/FILE_STORAGE/$FILE_STORAGE/g"                         ./ibm-aspera-hsts-icp4i/values_revised_2.yaml > ./ibm-aspera-hsts-icp4i/values_revised_3.yaml
sed "s/REPOSITORY/$REPOSITORY/g"                             ./ibm-aspera-hsts-icp4i/values_revised_3.yaml > ./ibm-aspera-hsts-icp4i/values_revised_4.yaml
sed "s/PULL_SECRET/$PULL_SECRET/g"                           ./ibm-aspera-hsts-icp4i/values_revised_4.yaml > ./ibm-aspera-hsts-icp4i/values_revised_5.yaml
sed "s/PROXY_ENDPOINT/$PROXY_ENDPOINT/g"                     ./ibm-aspera-hsts-icp4i/values_revised_5.yaml > ./ibm-aspera-hsts-icp4i/values_revised_6.yaml
sed "s/REPLICAS/$REPLICAS/g"                                 ./ibm-aspera-hsts-icp4i/values_revised_6.yaml > ./ibm-aspera-hsts-icp4i/values_revised_7.yaml
sed "s/SERVER_SECRET/$SERVER_SECRET/g"                       ./ibm-aspera-hsts-icp4i/values_revised_7.yaml > ./ibm-aspera-hsts-icp4i/values_revised_8.yaml
sed "s/NODE_ADMIN_SECRET/$NODE_ADMIN_SECRET/g"               ./ibm-aspera-hsts-icp4i/values_revised_8.yaml > ./ibm-aspera-hsts-icp4i/values_revised_9.yaml
sed "s/ACCESSKEY_SECRET/$ACCESSKEY_SECRET/g"                 ./ibm-aspera-hsts-icp4i/values_revised_9.yaml > ./ibm-aspera-hsts-icp4i/values_revised_10.yaml
sed "s/KAFKAPORT/$KAFKAPORT/g"                               ./ibm-aspera-hsts-icp4i/values_revised_10.yaml > ./ibm-aspera-hsts-icp4i/values_revised_11.yaml
sed "s/ASCP_NODE_LABEL/$ASCP_NODE_LABEL/g"                   ./ibm-aspera-hsts-icp4i/values_revised_11.yaml > ./ibm-aspera-hsts-icp4i/values_revised_12.yaml
sed "s/NODED_NODE_LABEL/$NODED_NODE_LABEL/g"                   ./ibm-aspera-hsts-icp4i/values_revised_12.yaml > ./ibm-aspera-hsts-icp4i/values.yaml 
rm ./ibm-aspera-hsts-icp4i/values_revised_1.yaml
rm ./ibm-aspera-hsts-icp4i/values_revised_2.yaml
rm ./ibm-aspera-hsts-icp4i/values_revised_3.yaml
rm ./ibm-aspera-hsts-icp4i/values_revised_4.yaml
rm ./ibm-aspera-hsts-icp4i/values_revised_5.yaml
rm ./ibm-aspera-hsts-icp4i/values_revised_6.yaml
rm ./ibm-aspera-hsts-icp4i/values_revised_7.yaml
rm ./ibm-aspera-hsts-icp4i/values_revised_8.yaml
rm ./ibm-aspera-hsts-icp4i/values_revised_9.yaml
rm ./ibm-aspera-hsts-icp4i/values_revised_10.yaml
rm ./ibm-aspera-hsts-icp4i/values_revised_11.yaml
rm ./ibm-aspera-hsts-icp4i/values_revised_12.yaml

oc create -f pv.yaml

helm install --name $RELEASE --namespace $PROJECT  ibm-aspera-hsts-icp4i  --tls --debug
