#!/bin/bash

avs=`az vm availability-set list -g $RESOURCE_GROUP -o table | grep $RESOURCE_GROUP | awk -F' ' '{print $2}'`
nicname=`az network nic list -g $RESOURCE_GROUP -o table | grep $avs | awk -F' ' '{print $3}' | xargs`
lbname=`az network lb list -o table | grep $RESOURCE_GROUP | awk -F' ' '{print $2}'`
poolid=`az network lb address-pool list --resource-group $RESOURCE_GROUP --lb-name $lbname | grep backendAddressPools | awk -F'"' '{print $4}'`
for n in $nicname
do
ipcn=`az network nic ip-config list --nic-name $n -g $RESOURCE_GROUP -o table | grep $RESOURCE_GROUP | awk -F' ' '{print $1}'`
az network nic update -g $RESOURCE_GROUP --name $n \
--set ipConfigurations[name=$ipcn].loadBalancerBackendAddressPools=[] \
--add ipConfigurations[name=$ipcn].loadBalancerBackendAddressPools \
id="$poolid"
done

