# this is a module that can be reused somewhere else

terraform { # global (means this module level) terraform setting. this is mandatory for below code to work
  required_providers { # configured azure as provider
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.40.0"
    }
  }
}

# create a storage account
resource "azurerm_storage_account" "sa" {
  name                     = var.saname # accessing storage account parameters as variables
  resource_group_name      = var.rgname
  location                 = var.location != "" ? var.location : "southcentralus" # conditional statements, if location is not empty, leave it otherwise use southcentralus
  account_tier             = "Standard"
  account_replication_type = "GRS"

}