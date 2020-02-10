#!/bin/bash

PROJECT=mq

oc project $PROJECT
oc -n $PROJECT create rolebinding $PROJECT-security-policy --clusterrole=ibm-anyuid-hostpath-scc --group=system:serviceaccounts:$PROJECT

oc apply -f mq-role.yaml
oc apply -f mq-role-binding.yaml
