#!/bin/bash

RESOURCE_GROUP=$1


if [ -z "$(which az)" ]
then
    echo "CLI v2 'az' command not found, falling back to v1 'azure'"
    azure group create $1 "eastus"
    azure group deployment create -f mainTemplate.json -e mainTemplateParameters.json $RESOURCE_GROUP dse

else
    echo "CLI v2 'az' command found"
    az group create --name $RESOURCE_GROUP --location "eastus"
    az group deployment create \
     --resource-group $RESOURCE_GROUP \
     --template-file mainTemplate.json \
     --parameters @mainTemplateParameters.json \
     --verbose
    az group deployment create \
     --resource-group $RESOURCE_GROUP \
     --template-file loadbalancer.json \
     --parameters @lbParameters.json \
     --verbose
fi
export RESOURCE_GROUP
./bepool_config.sh

