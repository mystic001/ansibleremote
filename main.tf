terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

# module "vnet" {
#   source = "./modules/vnet"

#   resource_group_name = azurerm_resource_group.rg.name
#   location           = var.location
#   vnet_name          = var.vnet_name
#   address_space      = var.address_space
#   subnets            = var.subnets
#   tags               = var.tags
# }
