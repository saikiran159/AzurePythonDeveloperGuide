# terraform global state
terraform {
  required_providers { # need azurerm as we want to deploy resources in azure
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.40.0"
    }
  }
}

# create an NSG
resource "azurerm_network_security_group" "nsg" {
  name                = var.nsgname # from variables
  location            = var.location
  resource_group_name = var.rgname
  
  # without dynamic, syntax will be like this
  # security_rule {name = "" priority = "" ...}
  # security_rule {name = "" priority = "" ...}

  dynamic security_rule { # hence dynamic
    for_each = var.nsg_rule # this is that iist that we are looping
    content{
      name                       = security_rule.value.name
      priority                   = security_rule.value.priority
      direction                  = security_rule.value.direction
      access                     = security_rule.value.access
      protocol                   = security_rule.value.protocol
      source_port_range          = security_rule.value.source_port_range
      destination_port_range     = security_rule.value.destination_port_range
      source_address_prefix      = security_rule.value.source_address_prefix
      destination_address_prefix = security_rule.value.destination_address_prefix
    }
  }
}