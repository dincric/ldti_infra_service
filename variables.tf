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

variable "admin_username" {
    type = string
    description = "Administrator username for server"
    default  = "terraadmin"
}

variable "admin_password" {
    type = string
    description = "Administrator password for server"
     default = "S3cur3P@ssw0rd"
}

variable "vnet_address_space" {
    type = list
    description = "Address space for Virtual Network"
    default = ["10.0.0.0/16"]
}

variable "managed_disk_type" {
    type = map
    description = "Disk type Premium in Primary location Standard in DR location"

    default = {
        westus2 = "Premium_LRS"
        eastus = "Standard_LRS"
    }
}

variable "vm_size" {
    type = string
    description = "Size of VM"
    default = "Standard_B1s"
}

variable "os" {
    description = "OS image to deploy"
    type = object({
        publisher = string
        offer = string
        sku = string
        version = string
  })
     default = {

        publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04.0-LTS"
    version   = "latest"
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
