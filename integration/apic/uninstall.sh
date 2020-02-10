#!/bin/bash

PROJECT=apic
RELEASE=$PROJECT-dev

helm delete $RELEASE --purge --tls
