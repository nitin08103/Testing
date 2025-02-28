terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.113.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {
    
  }
}

locals {
  tags = {
    app = "test-app"
    env = "testing"

  }
}


resource "azurerm_resource_group" "rarg" {
  name     = "rg123"
  location = "West Europe"
  tags     = local.tags
}

resource "azurerm_storage_account" "stg" {
  name                     = "storageaccountname"
  resource_group_name      = azurerm_resource_group.rarg.name
  location                 = azurerm_resource_group.rarg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  tags     = local.tags
}