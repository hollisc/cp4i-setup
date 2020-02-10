#!/bin/bash
PROJECT=eventstreams
RELEASE=$PROJECT-dev

GENERATE_CERTIFICATE=true
CERTIFICATE_SECRET_NAME=eventstreamcertificate
PULL_SECRET=ibm-entitlement-key
PERSISTENCE_ENABLE=true
USE_DYNAMIC_PROVISIONING=true
# In case of IBM Cloud use ibmc-block-gold for the file storage
BLOCK_STORAGE=rook-ceph-block
# In case of IBM Cloud use ibmc-file-gold for the file storage
FILE_STORAGE=nfs
ACCEPT_LICENSE=accept

sed "s/GENERATE_CERTIFICATE/$GENERATE_CERTIFICATE/g"           ./ibm-eventstreams-icp4i-prod/values_template.yaml  > ./ibm-eventstreams-icp4i-prod/values_revised_1.yaml
sed "s/CERTIFICATE_SECRET_NAME/$CERTIFICATE_SECRET_NAME/g"     ./ibm-eventstreams-icp4i-prod/values_revised_1.yaml > ./ibm-eventstreams-icp4i-prod/values_revised_2.yaml
sed "s/PULL_SECRET/$PULL_SECRET/g"                             ./ibm-eventstreams-icp4i-prod/values_revised_2.yaml > ./ibm-eventstreams-icp4i-prod/values_revised_3.yaml
sed "s/PERSISTENCE_ENABLE/$PERSISTENCE_ENABLE/g"               ./ibm-eventstreams-icp4i-prod/values_revised_3.yaml > ./ibm-eventstreams-icp4i-prod/values_revised_4.yaml
sed "s/USE_DYNAMIC_PROVISIONING/$USE_DYNAMIC_PROVISIONING/g"   ./ibm-eventstreams-icp4i-prod/values_revised_4.yaml > ./ibm-eventstreams-icp4i-prod/values_revised_5.yaml
sed "s/BLOCK_STORAGE/$BLOCK_STORAGE/g"                         ./ibm-eventstreams-icp4i-prod/values_revised_5.yaml > ./ibm-eventstreams-icp4i-prod/values_revised_6.yaml
sed "s/FILE_STORAGE/$FILE_STORAGE/g"                           ./ibm-eventstreams-icp4i-prod/values_revised_6.yaml > ./ibm-eventstreams-icp4i-prod/values_revised_7.yaml
sed "s/ACCEPT_LICENSE/$ACCEPT_LICENSE/g"                       ./ibm-eventstreams-icp4i-prod/values_revised_7.yaml > ./ibm-eventstreams-icp4i-prod/values.yaml 
rm ./ibm-eventstreams-icp4i-prod/values_revised_1.yaml
rm ./ibm-eventstreams-icp4i-prod/values_revised_2.yaml
rm ./ibm-eventstreams-icp4i-prod/values_revised_3.yaml
rm ./ibm-eventstreams-icp4i-prod/values_revised_4.yaml
rm ./ibm-eventstreams-icp4i-prod/values_revised_5.yaml
rm ./ibm-eventstreams-icp4i-prod/values_revised_6.yaml
rm ./ibm-eventstreams-icp4i-prod/values_revised_7.yaml

oc create -f pv.yaml

helm install --name $RELEASE --namespace $PROJECT  ibm-eventstreams-icp4i-prod  --tls --debug
