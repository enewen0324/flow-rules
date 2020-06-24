#!/bin/bash

curl -X DELETE --user onos:rocks --header 'Accept: application/json' 'http://127.0.0.1:8181/onos/v1/flows/application/org.onosproject.rest'

