# make sure not to include any secrets as default values

variable "location" { # variable name
    type = string # data type of variable
    description = "Azure location of terraform server environment"
    default = "westus2" # default value. (optional)
}

variable "vnet_address_space" { 
    type = list
    description = "Address space for Virtual Network"
    default = ["10.0.0.0/16"] # (optional)
}

variable "snet_address_space" { 
    type = list
    description = "Address space for Virtual Network"
    default = ["10.0.0.0/24"] # (optional)
}

variable "servername" {
    type = string
    description = "Server name of the virtual machine"
}

variable "admin_username" {
    type = string
    description = "Administrator username for server"
}

variable "admin_password" {
    type = string
    description = "Administrator password for server"
}


variable "managed_disk_type" { 
    type = map
    description = "Disk type Premium in Primary location Standard in DR location"

    default = {
        westus2 = "Premium_LRS"
        southcentralus = "Standard_LRS"
    }
}

variable "vm_size" {
    type = string
    description = "Size of VM"
    default = "Standard_B1s"
}

variable "os" {
    description = "OS image to deploy"
    type = object({
        publisher = string
        offer = string
        sku = string
        version = string
  })
}      