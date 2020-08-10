variable "location" {
  description = "Azure location where all resources should be created"
  default     = "West US"
}

variable "env" {
  description = "Subscription environment"
  default     = "dev"
}

variable "subscription_id" {
  description = "Subscription ID"
}

variable "vnet" {
  description = "Vnet"
}

variable "subnet" {
  description = "subnet"
}

variable "purpose" {
  description = "Why instance is created"
}


variable "storage_account_name" {
  description = "Storage Account name"
}

variable "resource_group_name" {
  description = "resource group name for storage account"
}

variable "subnet_id" {
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
  default = "tfstate"
}

variable "container_access_type" {
  default = "private"
}

variable "file_share" {
  default = "file_shae"
}

variable "key" {
  description = "storage account remote backend state key"
}

variable "vm_name" {
  description = "Name of the VM"
  default = "LXSASDID02"
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