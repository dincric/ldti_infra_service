variable "location" {
  type = "string"
  description = "Azure location where all resources should be created"
  default     = "Westus2"
}

variable "env" {
  type = "string"
  description = "Subscription environment"
  default     = "dev"
}

 variable "subscription_id" {
    type = "string"
    default = "f2e3c986-2967-4d73-bb15-728b54715951"
  }

  variable "client_id" {
    type = "string"
    default = "8ad1e4c4-2bbe-4d4b-b54b-335da2aa70b4"
  }

  variable "client_secret" {
    type = "string"
    default = "Nkdox_DkC~XAtb6xPI0k59Wu7.qrE6qCs_"

  }

  variable "tenant_id" {
    type = "string"
    default = "70765d76-0633-4af1-8b6e-c7543d557969"
  }



variable "storage_account_name" {
  description = "Storage Account name"
  default = "terraformstate28812"
}

variable "resource_group_name" {
  description = "resource group name for storage account"
  default = "Terraform-States"
}



variable "account_kind" {
  default = "StorageV2"
}

variable "account_tier" {
  default = "Standard"
}

variable "account_replication_type" {
  default = "LRS"
}

variable "enable_https_traffic_only" {
  default = true
}

variable "ip_rules" {
  default = []
}

variable "container_name" {
  default = "terraformstate-tst"
}

variable "container_access_type" {
  default = "private"
}

variable "file_share" {
  default = "file_shae"
}

variable "key" {
  description = "storage account remote backend state key"
  default = "tst.tfstate"
  
}



variable "sql_server_name" {
  description = "Name of the SQL Server"
  default = "sqldstideveu2"
}

variable "mssql_elasticpool" {
  description = "Name of the SQL Pool"
  default = "CNO_DATA_HUB"
}

locals {
  default_tags = {
    "backup"           = "no"
    "managedBy"        = ""
    "projectName"      = "Azure"
    "projectVersion"   = "1.0"
    "environment"      = var.env
  }
}
