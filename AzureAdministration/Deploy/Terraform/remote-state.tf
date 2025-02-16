
# First, let's create azure storage account, create a container, enable change feed and blob versioning,
# so that every update to this file is versioned and saved automatically. 
# we can enable soft delete too with 30 days retention based on your deployment frequency.

# az storage account create --name remotestore --resource-group tf-test-rg --location eastus --sku Standard_LRS --encryption-services blob 
# az storage container create --name store --account-name remotestore --auth-mode login
# az storage account blob-service-properties update -n sasacal1509bae88 --enable-change-feed true --enable-versioning true

terraform { # global terraform configuration
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.40.0"
    }
  }
   backend "azurerm" {
    resource_group_name  = "tf-test-rg"
    storage_account_name = "remotestore"
    container_name       = "store"
    key                  = "test.terraform.tfstate"
  }
}

# Sets Azure cli as default authentication
provider "azurerm" {
  features {}
}


#Create virtual network
resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-dev-westus-001"
  address_space       = ["10.0.0.0/16"]
  location            = "westus"
  resource_group_name = "cal-1509-bae"
}

# Create subnet
resource "azurerm_subnet" "subnet" {
  name                 = "snet-dev-westus-001"
  resource_group_name  = "cal-1509-bae"
  virtual_network_name = azurerm_virtual_network.vnet.name # depends on virtual network
  address_prefixes     = ["10.0.0.0/24"]
}
