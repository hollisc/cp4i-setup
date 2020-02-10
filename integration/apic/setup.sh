#!/bin/bash

PROJECT=apic 

oc project $PROJECT
oc -n $PROJECT create rolebinding apic-security-policy --clusterrole=ibm-anyuid-hostpath-scc --group=system:serviceaccounts:$PROJECT

kubectl create secret generic apic-ent-helm-tls --from-file=cert.pem=$HOME/.helm/cert.pem --from-file=ca.pem=$HOME/.helm/ca.pem --from-file=key.pem=$HOME/.helm/key.pem -n apic

