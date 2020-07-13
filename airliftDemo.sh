#!/bin/bash
set -x
workdir="~/tf-demo"
configdir="${workdir}/config"
tfdir="${workdir}/tf-demo/deploy/terraform"
rgname="<your resource group name here>"

az account set --subscription "<your subscription ID here>"
az group delete --name $rgname --yes

rm -rf $workdir
mkdir -p ${workdir}
cd ${workdir}
git clone https://github.com/Azure/sap-hana.git tf-demo
cd tf-demo
#
#this git checkout is only temporary, should be removed 
git checkout b3b7d1a5b1fa764c16796314d987a6b28f78f7a9
#copy input json
mkdir ${configdir}
cp ~/ha.json ${configdir}
cp ~/sa.json ${configdir}
#source ./env.sh
#pwd
cd ${configdir}
terraform init --upgrade=true $tfdir
terraform plan --var-file=${configdir}/sa.json $tfdir
terraform apply --var-file=${configdir}/sa.json  --auto-approve $tfdir
