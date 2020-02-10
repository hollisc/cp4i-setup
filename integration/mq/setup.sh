#!/bin/bash

PROJECT=mq

oc create -f mq.yaml
oc create -f mq-role.yaml
oc create -f mq-role-binding.yaml

oc project $PROJECT
oc -n $PROJECT create rolebinding $PROJECT-security-policy --clusterrole=ibm-anyuid-hostpath-scc --group=system:serviceaccounts:$PROJECT

