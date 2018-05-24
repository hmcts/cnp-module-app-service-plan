#!/bin/bash

aseID=$1
location=$2

echo "Getting IP address ..."
ip=$(env AZURE_CONFIG_DIR=/opt/jenkins/.azure-sandbox bash -e az resource show --ids $aseID/capacities/virtualip --query internalIpAddress)
ilbIp=$(echo "$ip" | tr -d \")

echo "IP address is $ilbIp"

printf "%s" "$ilbIp" >> $location/ip.txt

