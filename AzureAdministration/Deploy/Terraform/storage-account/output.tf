# this file contains output for the storage-account module
output "primary_key" {
    description = "The primary access key for the storage account"
    value = azurerm_storage_account.sa.primary_access_key # this is accessed from main.tf file in this module
    sensitive   = true
}