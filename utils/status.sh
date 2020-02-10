#!/bin/bash

echo "Failing pods:"
oc get pods --all-namespaces | grep -v Running | grep -v Completed
