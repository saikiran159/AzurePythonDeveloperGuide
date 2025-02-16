# Terraform
terraform { # Terraform global setting
  required_providers { # using azure as provider here
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.40.0"
    }
  }
}
#Sets up azure cli authentication as default one to work with azure
provider "azurerm" {
  features {}
}
#Create virtual network
resource "azurerm_virtual_network" "vnet1" {
  name                = "vnet1-test-westus-001"
  address_space       = ["10.0.0.0/16"]
  location            = "westus"
  resource_group_name = "tf-test-rg"
}
# Create subnet
resource "azurerm_subnet" "subnet1" {
  name                 = "snet1-test-westus-001"
  resource_group_name  = "tf-test-rg"
  virtual_network_name = azurerm_virtual_network.vnet1.name
  address_prefixes     = ["10.0.0.0/24"]
}
#Create virtual network
resource "azurerm_virtual_network" "vnet2" {
  name                = "vnet2-test-westus-001"
  address_space       = ["10.1.0.0/16"]
  location            = "westus"
  resource_group_name = "tf-test-rg"
}
# Create subnet
resource "azurerm_subnet" "subnet2" {
  name                 = "snet2-test-westus-001"
  resource_group_name  = "tf-test-rg"
  virtual_network_name = azurerm_virtual_network.vnet2.name
  address_prefixes     = ["10.1.0.0/24"]
}