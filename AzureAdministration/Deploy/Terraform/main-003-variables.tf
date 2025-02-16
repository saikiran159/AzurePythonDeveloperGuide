# Terraform
terraform { # global settings for terraform
  required_providers { # specify providers here
    azurerm = { # azure provider
      source  = "hashicorp/azurerm"
      version = "2.40.0"
    }
  }
}

#Azure provider
provider "azurerm" { # authenticate to azure using cli
  features {}
}


#Create virtual network
resource "azurerm_virtual_network" "vnet" { # provide type of azure resource and it's name here
    name                = "vnet-test-${var.location}-1" # var looks at variables in variables.tf
    address_space       = var.vnet_address_space
    location            = var.location
    resource_group_name = "tf-test-rg"
}

# Create subnet
resource "azurerm_subnet" "subnet" {
  name                 = "snet-test-${var.location}-1 "
  resource_group_name  = "tf-test-rg"
  virtual_network_name = azurerm_virtual_network.vnet.name # depends on virtual network
  address_prefixes       = var.snet_address_space
}

# variables can be applied through terraform cli
# terraform apply -var='vnet_address_space=["10.0.0.0/16"]' -var='snet_address_space=["10.0.0.0/24"]' -var="location=southcentralus"

# Create network interface
resource "azurerm_network_interface" "nic" {
  name                      = "nic-${var.servername}-test-1 "
  location                  = var.location
  resource_group_name       = "tf-test-rg"

  ip_configuration {
    name                          = "nic-cfg-${var.servername}"
    subnet_id                     = azurerm_subnet.subnet.id # depends on subnet
    private_ip_address_allocation = "dynamic"
  }
}

# Create virtual machine
resource "azurerm_virtual_machine" "vm" {
  name                  = var.servername
  location              = var.location
  resource_group_name   = "tf-test-rg"
  network_interface_ids = [azurerm_network_interface.nic.id] # depends on virtual network interface
  vm_size               = "Standard_B1s"

  storage_os_disk {
    name              = "sto-vm${var.servername}osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = lookup(var.managed_disk_type, var.location, "Standard_LRS") # lookup is take first parameter as dict and second parameter as key. key doesn't resolve it will take default value
  }

  storage_image_reference { # for map type we have to use lookup for resolution, for object type, we can directly provide key
    publisher = var.os.publisher # os is object and publisher is key. this is correct. but we cant resolve like this for map data type
    offer     = var.os.offer
    sku       = var.os.sku
    version   = var.os.version
  }

  os_profile {
    computer_name  = var.servername
    admin_username = var.admin_username
    admin_password = var.admin_password
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}

output "private_ip" { # outputs to variable private_ip externally
    description = "IP Address of Virtual Machine"
    value = azurerm_network_interface.nic.private_ip_address
}