terraform {
  required_version = "~> 1.1.7"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.95.0"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

resource "azurerm_resource_group" "this" {
  name     = "RG-SANDBOX"
  location = "North Europe"
}

locals {
  sta = {
    "storage_account_1" = {
      replication = "GRS"
    },
    "storage_account_2" = {
      replication = "GRS"
    },
    "storage_account_3" = {
      replication = "GRS"
    },
  }
}

resource "azurerm_storage_account" "these" {
  for_each = local.sta

  name                     = each.key
  resource_group_name      = azurerm_resource_group.this.name
  location                 = azurerm_resource_group.this.location
  account_tier             = "Standard"
  account_replication_type = each.value.replication

  tags = {
    environment = "dev"
  }
}

resource "azurerm_storage_account" "this" {
  name                     = "alone"
  resource_group_name      = azurerm_resource_group.this.name
  location                 = azurerm_resource_group.this.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "dev"
  }
}
