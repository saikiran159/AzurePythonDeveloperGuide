# make sure not to include any secrets as default values. pass secret values only at runtime using terraform apply -var="location=eastus"

servername = "vmterraform"
location = "southcentralus"
admin_username = "terraadmin"
admin_password = "P@SSw0rdP@ssw0rd"
vnet_address_space = ["10.0.0.0/16"]
os = {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04.0-LTS"
    version   = "latest"
}