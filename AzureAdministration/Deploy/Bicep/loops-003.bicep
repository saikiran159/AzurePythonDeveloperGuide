param rgLocation string = resourceGroup().location // optional param

param storageConfig object = {
  storage1: {
    name: 'contoso'
    skuName: 'Standard_LRS'
  }
  storage2: {
    name: 'fabrikam'
    skuName: 'Premium_LRS'
  }
}

// loop through an object
resource createStorages 'Microsoft.Storage/storageAccounts@2022-09-01' = [for config in items(storageConfig): {
  name: '${config.value.name}${uniqueString(resourceGroup().id)}'
  location: rgLocation
  sku: {
    name: config.value.skuName
  }
  kind: 'StorageV2'
  
}]
