# Terraform scripts to deploy HANA

## Version 1 Terraforms
See [PoC Readme](#PoC/README.md) for more info.

Directory : [PoC/modules/single_node_hana](#PoC/modules/single_node_hana)
- Set environment via `PoC\SPScripts\source set-sp.sh` via Azure Cloud Shell
- check environment via `env | grep AZURE` and `env | grep ARM`
- Initialiaze using  `terraform init`
- Plan using `terraform plan`
- Deploy using `terraform apply`
- Remove using `terraform destroy`

Pay attention to the python version
If python3 then the ansible & azure sdk library for python3 needs to be installed

```pip3 install ansible```

For the Python Azure SDK you'll need multiple libraries.
See [How to install Azure library packages for Python](https://docs.microsoft.com/en-us/azure/developer/python/azure-sdk-install)

## Version 2 Terraforms

See [UsageGuide](#deploy/USAGE.md)

### Service Principal
See [Getting Started](#Documentation/getting-started.md)
A Service Principal needs to be created.
Script = createServicePrincipal.ps1
Service Principal Name = bdl_terraform

```
{
    "appId": "d86a54b5-6f6d-4c09-b0d6-8cdf6c994260",   
    "displayName": "bdl_terraform",
    "name": "http://bdl_terraform",
    "password": "7466c204-963b-4a97-8c51-c00458e95126",
    "tenant": "72f988bf-86f1-41af-91ab-2d7cd011db47"   
}
```
```
"appId": "<service-principal-app-id>",
"displayName": "<service-principal-name>",
"name": "http://<service-principal-name>",
"password": "<service-principal-password>",
"tenant": "<service-principal-tenant-id>"
```

The id of the Service Principal needs to set in the ENVIRONMENT
Scripts = createEnvironment.sh
Run this script to set the environment variables in Linux
Set the environment variables via source setenvironment.sh

### Template Adjustment
See [Adjusting the Template](#documentation/json-adjusting-template.md)\
Workspace directory = Deployments
#### Single HANA Deployment

```bash
  terraform plan -var-file=<JSON configuration file> <automation_root>/sap-hana/deploy/terraform
```

### Running the Terraform deployment

1. Initialize - Initialize the Terraform Workspace

2. Plan - Plan it. Terraform performs a deployment check.

3. Apply - Execute deployment.

<br><br><br>

### Terraform Operations

- From the Workspace directory that you created.

<br>

#### Initialize

- Initializes the Workspace by linking in the path to the runtime code and downloading execution Providers.

  ```bash
  terraform init <automation_root>/sap-hana/deploy/terraform
  ```

- To re-initialize, add the `--upgrade=true` switch.

  ```bash
  terraform init --upgrade=true <automation_root>/sap-hana/deploy/terraform
  ```

<br>

#### Plan

- A plan tests the *code* to see what changes will be made.
- If a Statefile exists, it will compare the *code*, the *statefile*, and the *resources* in Azure in order to detect drift and will display any changes or corrections that will result, and the actions that will be performed.

  ```bash
  terraform plan -var-file=<JSON configuration file> <automation_root>/sap-hana/deploy/terraform
  ```

<br>

#### Apply

- Apply executes the work identified by the Plan.
- A Plan is also an implicit step in the Apply that will ask for confirmation.

  ```bash
  terraform apply -var-file=<JSON configuration file> <automation_root>/sap-hana/deploy/terraform
  ```

- To automatically confirm, add the `--auto-approve` switch.

  ```bash
  terraform apply --auto-approve -var-file=<JSON configuration file> <automation_root>/sap-hana/deploy/terraform
  ```

<br>

## Outputs

After the deployment finishes, you will see a message like the one below:

```bash
Apply complete! Resources: 34 added, 0 changed, 0 destroyed.

Outputs:

jumpbox-public-ip-address = xx.xxx.xx.xxx
jumpbox-username = xxx
``` 
