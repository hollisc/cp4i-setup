#!/bin/bash

PROJECT=aspera

oc project $PROJECT
oc -n $PROJECT create rolebinding $PROJECT-security-policy --clusterrole=ibm-anyuid-hostaccess-scc --group=system:serviceaccounts:$PROJECT
oc adm policy add-scc-to-group anyuid system:serviceaccounts:$PROJECT

# THIS WILL VARY PER ENVIRONMENT
oc label node 10.191.43.186  node-role.kubernetes.io/ascp=true
oc label node 10.191.43.186  node-role.kubernetes.io/noded=true

kubectl create secret generic aspera-server --from-file=ASPERA_LICENSE="./aspera-license" --from-literal=TOKEN_ENCRYPTION_KEY="$(LC_CTYPE=C tr -dc A-Za-z0-9_\!\@\#\$\%\^\&\*\(\)-+= < /dev/urandom |   tr -dc A-Za-z0-9 | head -c 40 )"
kubectl create secret generic asperanode-nodeadmin --from-literal=NODE_USER="myuser" --from-literal=NODE_PASS="mypassword"
kubectl create secret generic asperanode-accesskey --from-literal=ACCESS_KEY_ID="my_access_key" --from-literal=ACCESS_KEY_SECRET="my_access_key_secret"

oc create -f apsera-sa-role.yaml
oc create -f cluster-admin-clusterrole.yaml
oc create -f hsts-prod-rolebinding.yaml
oc create -f namespace-user-clusterrole.yaml
oc create -f namespace-user-role.yaml
oc create -f namespace-user-rolebinding.yaml
oc create -f secret-gen-role.yaml
oc create -f secret-gen-rolebinding.yaml
oc create -f secret-gen-sa.yaml
