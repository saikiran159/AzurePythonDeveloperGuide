@minLength(3) // validations for storageAccountName parameter: min storageaccount name length
@maxLength(24) // max storageaccount name length
@description('Provide a name for the storage account. Use only lowercase letters and numbers. The name must be unique across Azure.') // description
param storageAccountName string = 'store${uniqueString(resourceGroup().id)}' // storage account parameter name
param location string = resourceGroup().location // storage account location

resource virtualNetwork 'Microsoft.Network/virtualNetworks@2024-05-01' = { // create a virtual network
  name: 'exampleVNet' // name of virtual network
  location: location // location of virtual network
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
    subnets: [ // added two subnets
      {
        name: 'Subnet-1'
        properties: {
          addressPrefix: '10.0.0.0/24'
        }
      }
      {
        name: 'Subnet-2'
        properties: {
          addressPrefix: '10.0.1.0/24'
        }
      }
    ]
  }
}

resource storageAccount 'Microsoft.Storage/storageAccounts@2023-05-01' = { // create a storage account name
  name: storageAccountName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}
