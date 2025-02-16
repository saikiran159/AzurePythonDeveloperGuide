# this is terraform global config
terraform {
  required_providers { # this is to use azure
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.40.0"
    }
  }
}

# this is to use azure cli for auth
provider "azurerm" {
  features {}
}

# use module
module "storage_account1" { # provide name to the module
  source    = "./storage-account" # source where module exist 
  saname    = "st-test-1" # 
  rgname    = "tf-test-rg"
  location  = "eastus"
}

# we can same module multiple times
module "storage_account2" {
  source    = "./storage-account"
  saname    = "st-test-2"
  rgname    = "tf-test-rg"
  location  = "eastus"
}

output "storage_account1_key" {
  value = module.storage_account1.primary_key
}

output "storage_account2_key" {
  value = module.storage_account2.primary_key
}