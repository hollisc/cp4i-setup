#!/bin/bash

PROJECT=aspera
RELEASE=$PROJECT-dev

helm delete $RELEASE --purge --tls

oc project $PROJECT
oc delete pvc --all
oc delete -f pv.yaml
