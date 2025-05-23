terraform {
  backend "azurerm" {
    resource_group_name  = "terraform-state-rg"
    storage_account_name = "tfstate14839"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
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

  resource_group_name = "dev-vnet-rg"
  location           = "eastus"
  vnet_name          = "dev-vnet-test"
  address_space      = ["10.1.0.0/16"]

  subnets = {
    subnet1 = {
      name             = "dev-subnet1"
      address_prefixes = ["10.1.1.0/24"]
    }
    subnet2 = {
      name             = "dev-subnet2"
      address_prefixes = ["10.1.2.0/24"]
    }
  }

  tags = {
    Environment = "Development"
    Project     = "MyProject"
  }
} 