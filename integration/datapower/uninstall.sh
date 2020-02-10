#!/bin/bash

PROJECT=datapower
RELEASE=$PROJECT-dev

helm delete $RELEASE --purge --tls
