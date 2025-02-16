terraform { # terraform global setting
  required_providers {
    azurerm = { # azure provider
      source  = "hashicorp/azurerm"
      version = "2.40.0"
    }
  }
}

# use azure cli for auth
provider "azurerm" {
  features {}
}

# create 3 nsg's of sme configuration but different names
module "nsg" {
    source = "./network" # source of module
    count = 3 # how many NSG's we have to create
    nsgname    = "test-nsg${count.index}" # unique nsg name
    rgname    = "tf-test-rg"
    location  = "eastus"

    nsg_rule =[
    {
    name                       = "http"
    priority                   = 201
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
    },
    {
     name                       = "ssh"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "22"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
    }
]
}