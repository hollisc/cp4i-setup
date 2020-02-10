#!/bin/bash

PROJECT=assetrepo

oc project $PROJECT
oc -n $PROJECT create rolebinding $PROJECT-security-policy --clusterrole=ibm-anyuid-scc --group=system:serviceaccounts:$PROJECTi

oc adm policy add-scc-to-user privileged -n$PROJECT -z default
oc adm policy add-scc-to-group ibm-anyuid-scc system:serviceaccounts:default

oc adm policy add-scc-to-user privileged -n$PROJECT -z asset-repo-dev-icp4i-asset-repo-handle-secret-serviceaccount
oc adm policy add-scc-to-group ibm-anyuid-scc system:serviceaccounts:asset-repo-dev-icp4i-asset-repo-handle-secret-serviceaccount
