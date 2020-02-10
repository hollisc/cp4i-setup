#!/bin/bash

PROJECT=eventstreams
RELEASE=$PROJECT-dev

helm delete $RELEASE --purge --tls

oc project $PROJECT
oc delete pvc --all
oc delete -f pv.yaml
oc delete secret eventstreamcertificate
