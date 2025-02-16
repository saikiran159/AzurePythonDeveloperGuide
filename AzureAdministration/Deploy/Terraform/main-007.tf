# In this file we want to import alerady created resource in azure to terraform
# or you can think like this, you have lost terraform.tfstate file. you want this

terraform { # global terraform state definition
  required_providers { # we want to deploy resources to azure. so we need azurerm
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.40.0" # this is the version and this can change overtime
    }
  }
}

# this will use azure cli state to authenticate itself to deploy these resources
provider "azurerm" {
  features {}
}

# we need to define the resource type we want to import and keep attributes empty.
resource "azurerm_virtual_network" "vnet" {
  name = "vnet-1" // replace with output from terrafom import azurerm_virtual_network.vnet ... command
  location = "eastus" // replace with output from terrafom import azurerm_virtual_network.vnet .. command
  resource_group_name = "tf-test-rg" // replace with output from terrafom import azurerm_virtual_network.vnet .. command
  address_space = ["10.0.0.0/16"] // replace with output from terrafom import azurerm_virtual_network.vnet ... command
}

# Execute below commands 
# 1. VNETID=$(az network vnet show -g tf-test-rg -n test-vnet --query [id] --output tsv) # this will output id of the resource
# 2. terraform import azurerm_virtual_network.vnet $VNETID (this step will create a terraform.tfstate file)
# 3. terraform show (this will print the resource attributes. copy them and paste above and fix any mistakes. this is a manual process. imports are always tricky)