#!/bin/bash

PROJECT=tracing
RELEASE=$PROJECT-dev

helm delete $RELEASE --purge --tls

oc project $PROJECT
oc delete pvc --all
