terraform {
  backend "azurerm" {
    resource_group_name  = "terraform-state-rg"
    storage_account_name = "tfstate14839"  # Replace with your storage account name
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate"
    use_azuread_auth     = true
  }
}

resource "random_string" "suffix" {
  length  = 8
  special = false
  upper   = false
}

module "vnet" {
  source = "../../"

  resource_group_name = "prod-vnet-rg"
  location           = "eastus"
  vnet_name          = "prod-vnet"
  address_space      = ["10.0.0.0/16"]

  subnets = {
    subnet1 = {
      name             = "prod-subnet1"
      address_prefixes = ["10.0.1.0/24"]
    }
    subnet2 = {
      name             = "prod-subnet2"
      address_prefixes = ["10.0.2.0/24"]
    }
  }

  tags = {
    Environment = "Production"
    Project     = "MyProject"
  }
} 