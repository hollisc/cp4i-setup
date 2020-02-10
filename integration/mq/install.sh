#!/bin/bash
PROJECT=mq
RELEASE=$PROJECT-dev

ACCEPT_LICENSE="accept"
PRODUCTION_DEPLOY=false
PULL_SECRET=ibm-entitlement-key
TLS_GENERATE=true
TLS_HOSTNAME=$(oc get routes -n kube-system | grep proxy | awk -F' ' '{print $2 }')
# In case of IBM Cloud use ibmc-file-gold for the file storage
FILE_STORAGE="nfs"
QMGR_NAME="MYQMGR"

sed "s/ACCEPT_LICENSE/$ACCEPT_LICENSE/g"        ./ibm-mqadvanced-server-integration-prod/values_template.yaml  > ./ibm-mqadvanced-server-integration-prod/values_revised_1.yaml
sed "s/PRODUCTION_DEPLOY/$PRODUCTION_DEPLOY/g" ./ibm-mqadvanced-server-integration-prod/values_revised_1.yaml > ./ibm-mqadvanced-server-integration-prod/values_revised_2.yaml
sed "s/PULL_SECRET/$PULL_SECRET/g"             ./ibm-mqadvanced-server-integration-prod/values_revised_2.yaml > ./ibm-mqadvanced-server-integration-prod/values_revised_3.yaml
sed "s/TLS_GENERATE/$TLS_GENERATE/g"           ./ibm-mqadvanced-server-integration-prod/values_revised_3.yaml > ./ibm-mqadvanced-server-integration-prod/values_revised_4.yaml
sed "s/TLS_HOSTNAME/$TLS_HOSTNAME/g"           ./ibm-mqadvanced-server-integration-prod/values_revised_4.yaml > ./ibm-mqadvanced-server-integration-prod/values_revised_5.yaml
sed "s/FILE_STORAGE/$FILE_STORAGE/g"           ./ibm-mqadvanced-server-integration-prod/values_revised_5.yaml > ./ibm-mqadvanced-server-integration-prod/values_revised_6.yaml
sed "s/QMGR_NAME/$QMGR_NAME/g"                 ./ibm-mqadvanced-server-integration-prod/values_revised_6.yaml > ./ibm-mqadvanced-server-integration-prod/values.yaml 
rm ./ibm-mqadvanced-server-integration-prod/values_revised_1.yaml
rm ./ibm-mqadvanced-server-integration-prod/values_revised_2.yaml
rm ./ibm-mqadvanced-server-integration-prod/values_revised_3.yaml
rm ./ibm-mqadvanced-server-integration-prod/values_revised_4.yaml
rm ./ibm-mqadvanced-server-integration-prod/values_revised_5.yaml
rm ./ibm-mqadvanced-server-integration-prod/values_revised_6.yaml

oc create -f pv.yaml
oc create -f pvc.yaml
  
helm install --name $RELEASE --namespace $PROJECT  ibm-mqadvanced-server-integration-prod  --tls --debug
