#!/bin/bash

PROJECT=datapower

oc project $PROJECT
oc -n $PROJECT create rolebinding $PROJECT-security-policy --clusterrole=ibm-anyuid-hostpath-scc --group=system:serviceaccounts:$PROJECT
