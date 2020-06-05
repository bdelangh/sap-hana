#!/bin/bash

#run this file to set the environment variables in Linux
#Set the environment variables via
# source setenvironment.sh

# This is the Azure SubscriptionID
echo export AZURE_SUBSCRIPTION_ID='37d02782-ca89-46c0-abac-ef2c0ae81726' > set-sp.sh
# This is the Application ID
echo export AZURE_CLIENT_ID='d86a54b5-6f6d-4c09-b0d6-8cdf6c994260' >> set-sp.sh
# This is the value of the 'password' from the Application
echo export AZURE_SECRET='7466c204-963b-4a97-8c51-c00458e95126' >> set-sp.sh
# This is the Active Directory SubscriptionId
echo export AZURE_TENANT='72f988bf-86f1-41af-91ab-2d7cd011db47' >> set-sp.sh

# Terraform
# This is the Azure SubscriptionID
echo export ARM_SUBSCRIPTION_ID='37d02782-ca89-46c0-abac-ef2c0ae81726' >> set-sp.sh
# This is the Active Directory SubscriptionId
echo export ARM_TENANT_ID='72f988bf-86f1-41af-91ab-2d7cd011db47' >> set-sp.sh
# This is the ApplicationID
echo export ARM_CLIENT_ID='d86a54b5-6f6d-4c09-b0d6-8cdf6c994260' >> set-sp.sh
# This is the value of the 'password' from the Application
echo export ARM_CLIENT_SECRET='7466c204-963b-4a97-8c51-c00458e95126' >> set-sp.sh


# Install Terraform : see https://computingforgeeks.com/how-to-install-terraform-on-ubuntu-centos-7/
# Ubuntu
# sudo apt-get install wget unzip
# export VER="0.12.19"
# wget https://releases.hashicorp.com/terraform/${VER}/terraform_${VER}_linux_amd64.zip
# unzip terraform_${VER}_linux_amd64.zip
# sudo mv terraform /usr/local/bin/
#
# which terraform
# terraform -v
# terraform

# Install ansible
# See https://www.techrepublic.com/article/how-to-install-ansible-on-ubuntu-server-18-04/
# sudo apt-add-repository ppa:ansible/ansible
# sudo apt-get update
# sudo apt-get install ansible -y



