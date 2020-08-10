# CNO - ldti IaaC service based in terraform
Repository for execution of Terraform modules for Azure (Resource Manager)

## Developer Requirements

* [Terraform](https://www.terraform.io/downloads.html) version 0.12.x +

## How to execute the modules

### The following Environment Variables must be set in your shell prior to running:

- `AZURE_CLIENT_ID`
- `AZURE_SECRET`
- `AZURE_SUBSCRIPTION_ID`
- `AZURE_TENANT`
- `MAINT_ENV`

## The following scenarios must be understood properly for terraform modules.

### Scenario: Storage account for remote backend state files

* Define the variables for storage account terraform/storage-account/environment/terraform.vars

```
# Terraform init
terraform init -backend-config="environment/{{ MAINT_ENV }}/terraform_backend.tfvars"

# Terraform plan
terraform plan -var-file="environment/{{ MAINT_ENV }}/terraform.tfvars"

# Terraform apply/destroy
terraform apply -var-file="environment/{{ MAINT_ENV }}/terraform.tfvars" --auto-approve

```

## Below are the detailed references taken for Terraform Azure RM modules.

* [Terraform Website](https://www.terraform.io)
* [AzureRM Provider Documentation](https://www.terraform.io/docs/providers/azurerm/index.html)
* [AzureRM Provider Usage Examples](https://github.com/terraform-providers/terraform-provider-azurerm/tree/master/examples)
