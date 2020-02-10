#!/bin/bash
PROJECT=ace
RELEASE=$PROJECT-dashboard-dev

PULL_SECRET=ibm-entitlement-key
PRODUCTION_DEPLOY=false
TLS_HOSTNAME=$(oc get routes -n kube-system | grep proxy | awk -F' ' '{print $2 }')
# In case of IBM Cloud use ibmc-file-gold for the file storage
FILE_STORAGE=nfs
REPLICA_COUNT=1 

sed "s/PULL_SECRET/$PULL_SECRET/g"             ./ibm-ace-dashboard-icp4i-prod/values_template.yaml  > ./ibm-ace-dashboard-icp4i-prod/values_revised_1.yaml
sed "s/PRODUCTION_DEPLOY/$PRODUCTION_DEPLOY/g" ./ibm-ace-dashboard-icp4i-prod/values_revised_1.yaml > ./ibm-ace-dashboard-icp4i-prod/values_revised_2.yaml
sed "s/TLS_HOSTNAME/$TLS_HOSTNAME/g"           ./ibm-ace-dashboard-icp4i-prod/values_revised_2.yaml > ./ibm-ace-dashboard-icp4i-prod/values_revised_3.yaml
sed "s/FILE_STORAGE/$FILE_STORAGE/g"           ./ibm-ace-dashboard-icp4i-prod/values_revised_3.yaml > ./ibm-ace-dashboard-icp4i-prod/values_revised_4.yaml
sed "s/REPLICA_COUNT/$REPLICA_COUNT/g"         ./ibm-ace-dashboard-icp4i-prod/values_revised_4.yaml > ./ibm-ace-dashboard-icp4i-prod/values.yaml 
rm ./ibm-ace-dashboard-icp4i-prod/values_revised_1.yaml
rm ./ibm-ace-dashboard-icp4i-prod/values_revised_2.yaml
rm ./ibm-ace-dashboard-icp4i-prod/values_revised_3.yaml
rm ./ibm-ace-dashboard-icp4i-prod/values_revised_4.yaml

oc create -f pv.yaml
  
helm install --name $RELEASE --namespace $PROJECT ibm-ace-dashboard-icp4i-prod  --tls --debug
