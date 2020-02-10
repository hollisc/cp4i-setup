#!/bin/bash

PROJECT=tracing

oc project $PROJECT
oc adm policy add-scc-to-group anyuid system:serviceaccounts:$PROJECT
oc -n $PROJECT create rolebinding $PROJECT-security-policy --clusterrole=ibm-anyuid-hostpath-clusterrole --group=system:serviceaccounts:$PROJECT
