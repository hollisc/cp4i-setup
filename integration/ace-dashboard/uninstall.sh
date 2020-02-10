#!/bin/bash

PROJECT=ace
RELEASE=$PROJECT-dashboard-dev

helm delete $RELEASE --purge --tls

oc project $PROJECT
PVC_NAME=$(oc get pvc | grep $RELEASE | awk -F' ' '{print $1 }')
oc delete pvc $PVC_NAME
oc delete -f pv.yaml
