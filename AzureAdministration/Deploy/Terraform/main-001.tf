terraform { # All terraform related settings are done here
  required_providers { # since terraform is used to automate infrastructure deployment, different providers come up to provide a software  to terraform
    azurerm = { # in our case, it is azure we want automate, azure provided software to terraform. So, developers can through terraform to deploy azure resources.
        source = "hashicorp/azurerm" # this is that piece of software
        version = "2.40.0" # this is the version of that price of software provided by azure. this is very important. changing this might have breaking changes in deployment
    }
  }
}

provider "azurerm" { # this provides a means to authenticate to azure. defaults to az tool from azure.
  features {}
}

resource "azurerm_virtual_network" "vnet" { # resource type followed by resource name
  name                = "myvnet" # name of the resource in azure
  location            = "West US" # resource location
  resource_group_name = "tf-rg" # resource group name
  address_space       = ["10.0.0.0/24"] # resource address space
}

# terraform init - this command will create a project space and install providers defined in this file
# terraform plan - this command will output the changes that are about to be done with this file
# terraform apply - this command will make the changes
# terraform destroy - this command will delete all resources mentioned in this file