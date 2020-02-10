#!/bin/bash
  
#!/bin/bash
PROJECT=assetrepo
RELEASE=$PROJECT-dev

PULL_SECRET=ibm-entitlement-key
TLS_GENERATE=true
TLS_HOSTNAME=$(oc get routes -n kube-system | grep proxy | awk -F' ' '{print $2 }')
TLS_SECRET=assetrepocert
# In case of IBM Cloud use ibmc-block-gold for the file storage
BLOCK_STORAGE=rook-ceph-block
# In case of IBM Cloud use ibmc-file-gold for the file storage
FILE_STORAGE=nfs
# In case of HA env, it can be set to 3
REPLICAS=1

sed "s/PULL_SECRET/$PULL_SECRET/g"     ./ibm-icp4i-asset-repo-prod/values_template.yaml  > ./ibm-icp4i-asset-repo-prod/values_revised_1.yaml
sed "s/TLS_GENERATE/$TLS_GENERATE/g"   ./ibm-icp4i-asset-repo-prod/values_revised_1.yaml > ./ibm-icp4i-asset-repo-prod/values_revised_2.yaml
sed "s/TLS_HOSTNAME/$TLS_HOSTNAME/g"   ./ibm-icp4i-asset-repo-prod/values_revised_2.yaml > ./ibm-icp4i-asset-repo-prod/values_revised_3.yaml
sed "s/TLS_SECRET/$TLS_SECRET/g"       ./ibm-icp4i-asset-repo-prod/values_revised_3.yaml > ./ibm-icp4i-asset-repo-prod/values_revised_4.yaml
sed "s/BLOCK_STORAGE/$BLOCK_STORAGE/g" ./ibm-icp4i-asset-repo-prod/values_revised_4.yaml > ./ibm-icp4i-asset-repo-prod/values_revised_5.yaml
sed "s/FILE_STORAGE/$FILE_STORAGE/g"   ./ibm-icp4i-asset-repo-prod/values_revised_5.yaml > ./ibm-icp4i-asset-repo-prod/values_revised_6.yaml
sed "s/REPLICAS/$REPLICAS/g"           ./ibm-icp4i-asset-repo-prod/values_revised_6.yaml > ./ibm-icp4i-asset-repo-prod/values.yaml 
rm ./ibm-icp4i-asset-repo-prod/values_revised_1.yaml
rm ./ibm-icp4i-asset-repo-prod/values_revised_2.yaml
rm ./ibm-icp4i-asset-repo-prod/values_revised_3.yaml
rm ./ibm-icp4i-asset-repo-prod/values_revised_4.yaml
rm ./ibm-icp4i-asset-repo-prod/values_revised_5.yaml
rm ./ibm-icp4i-asset-repo-prod/values_revised_6.yaml

oc create -f pv.yaml

helm install --name $RELEASE --namespace $PROJECT  ibm-icp4i-asset-repo-prod  --tls --debug
