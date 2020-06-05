#Create a Service Principal for Terraform

#Create service principal
$subscriptionId = (az account show --query id -o tsv)
$scope = "/subscriptions/" + $subscriptionId
az ad sp create-for-rbac --role="Contributor" --scopes=$scope --name bdl_terraform

# Can be found in Azure Portal under App registrations
#{
#    "appId": "d86a54b5-6f6d-4c09-b0d6-8cdf6c994260",   
#    "displayName": "bdl_terraform",
#    "name": "http://bdl_terraform",
#    "password": "7466c204-963b-4a97-8c51-c00458e95126",
#    "tenant": "72f988bf-86f1-41af-91ab-2d7cd011db47"   
#  }
#
# "appId": "<service-principal-app-id>",
# "displayName": "<service-principal-name>",
# "name": "http://<service-principal-name>",
# "password": "<service-principal-password>",
# "tenant": "<service-principal-tenant-id>"

