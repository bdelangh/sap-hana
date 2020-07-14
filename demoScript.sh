#!/bin/bash
configdir=~/projects/tf-demo/config
tfdir=~/projects/tf-demo/deploy/terraform

terraform init --upgrade=true $tfdir
terraform plan --var-file=$configdir/singleHANA.json $tfdir


