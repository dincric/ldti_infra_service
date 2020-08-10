provider "azurerm" {
  version = "~>2.6"
  features {}
}

terraform {
  backend "azurerm" {
  }
}

## Resource Group

resource "azurerm_resource_group" "rgname" {
  name     = var.resource_group_name
  location = var.location
  tags     = local.default_tags
}


## Azure Data Factory

resource "azurerm_data_factory" "example" {
  name                = "example"
  location            = azurerm_resource_group.rgname.location
  resource_group_name = azurerm_resource_group.rgname.name
}

## Azure Storage Accounts

resource "azurerm_storage_account" "main" {
  name                      = var.storage_account_name
  resource_group_name       = var.resource_group_name
  location                  = var.location
  account_kind              = var.account_kind
  account_tier              = var.account_tier
  account_replication_type  = var.account_replication_type
  enable_https_traffic_only = var.enable_https_traffic_only
  network_rules {
    default_action = "Deny"
    ip_rules       = var.ip_rules
    virtual_network_subnet_ids = [var.subnet_id]
  }

  tags = local.default_tags
}

## Azure Storage Container

resource "azurerm_storage_container" "storage-container" {
  name                  = var.container_name
  storage_account_name  = azurerm_storage_account.main.name
  container_access_type = var.container_access_type
}

## Azure File Share

resource "azurerm_storage_share" "example" {
  name                 = var.file_share
  storage_account_name = azurerm_storage_account.main.name
  quota                = 50

  acl {
    id = "MTIzNDU2Nzg5MDEyMzQ1Njc4OTAxMjM0NTY3ODkwMTI"

    access_policy {
      permissions = "rwdl"
      start       = "2019-07-02T09:38:21.0000000Z"
      expiry      = "2019-07-02T10:38:21.0000000Z"
    }
  }
}

## Azure Virtual Network Rerefence

data "azurerm_virtual_network" "vnet" {
  name                = var.vnet
  location            = azurerm_resource_group.rgname.location
  resource_group_name = azurerm_resource_group.rgname.name
}

## Azure Subnet Rerefence

data "azurerm_subnet" "subnet" {
  name                 = var.subnet
  resource_group_name  = azurerm_resource_group.rgname.name
  virtual_network_name = data.azurerm_virtual_network.vnet.name
}

## Azure Network Interface

resource "azurerm_network_interface" "main" {
  name                = "${var.vm_name}-nic"
  location            = azurerm_resource_group.rgname.location
  resource_group_name = azurerm_resource_group.rgname.name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = data.azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "main" {
  name                  = var.vm_name
  location              = azurerm_resource_group.rgname.location
  resource_group_name   = azurerm_resource_group.rgname.name
  network_interface_ids = [azurerm_network_interface.main.id]
  vm_size               = "Standard_DS1_v2"

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "hostname"
    admin_username = "testadmin"
    admin_password = "Password1234!"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }

  tags = local.default_tags

}

## Azure SQL Server

resource "azurerm_sql_server" "sql_server" {
  name                         = var.sql_server_name
  resource_group_name          = azurerm_resource_group.rgname.name
  location                     = azurerm_resource_group.rgname.location
  version                      = "12.0"
  administrator_login          = "4dm1n157r470r"
  administrator_login_password = "4-v3ry-53cr37-p455w0rd"
}


resource "azurerm_mssql_elasticpool" "mssql_elasticpool" {
  name                = var.mssql_elasticpool
  resource_group_name = azurerm_resource_group.rgname.name
  location            = azurerm_resource_group.rgname.location
  server_name         = azurerm_sql_server.sql_server.name
  license_type        = "LicenseIncluded"
  max_size_gb         = 756

  sku {
    name     = "GP_Gen5"
    tier     = "GeneralPurpose"
    family   = "Gen5"
    capacity = 4
  }

  per_database_settings {
    min_capacity = 0.25
    max_capacity = 4
  }
}
