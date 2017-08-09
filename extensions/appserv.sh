#!/usr/bin/env bash

username=$1
password=$2

echo "Input to node.sh is:"
echo username $username
echo password XXXXXX

sudo apt-get update
n=0
until [ $n -ge 8 ]
do
  sudo apt-get -y install unzip python-pip jq  && break
  echo "apt-get try $n failed, sleeping..."
  n=$[$n+1]
  sleep 15s
done

sudo pip install requests
sudo pip install cqlsh


