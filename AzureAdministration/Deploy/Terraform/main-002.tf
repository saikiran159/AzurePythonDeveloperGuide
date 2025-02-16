# Terraform
terraform { # terraform settings
  required_providers {
    azurerm = { # azure is the provider for us
      source  = "hashicorp/azurerm"
      version = "2.40.0"
     }
  }
}

#Azure provider
provider "azurerm" { # using azure with default azure cli auth
  features {}
}


#Create virtual network
resource "azurerm_virtual_network" "vnet" {
    name                = "vnet-1"
    address_space       = ["10.0.0.0/16","10.1.0.0/16"]
    location            = "southcentralus"
    resource_group_name = "tf-test-rg"
}

# Create subnet
resource "azurerm_subnet" "subnet" {
  name                 = "snet-1"
  resource_group_name  = "tf-test-rg"
  virtual_network_name = azurerm_virtual_network.vnet.name # this acts like depends on (kind of similar to bicep)
  address_prefixes       = ["10.0.0.0/24"]
}