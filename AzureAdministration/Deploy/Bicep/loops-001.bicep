param rgLocation string = resourceGroup().location // optional parameter
param storages array = [ // optional parameter
  {
    name: 'contoso'
    skuName: 'Standard_LRS'
  }
  {
    name: 'fabrikam'
    skuName: 'Premium_LRS'
  }
]

// for single resource creation,
// resource createStorages 'Microsoft.Storage/storageAccounts@2022-09-01' = {}
// for multiple resource creation,
// resource createStorages 'Microsoft.Storage/storageAccounts@2022-09-01' = [{},{}]
resource createStorages 'Microsoft.Storage/storageAccounts@2022-09-01' = [for storage in storages: {
  name: '${storage.name}obj${uniqueString(resourceGroup().id)}'
  location: rgLocation
  sku: {
    name: storage.skuName
  }
  kind: 'StorageV2'
}]


// for loop with index

// param storageNames array = [
//   'contoso'
//   'fabrikam'
// ]

// resource createStorages 'Microsoft.Storage/storageAccounts@2022-09-01' = [for (name, i) in storageNames: {
//   name: '${i}${name}${uniqueString(resourceGroup().id)}'
//   location: rgLocation
//   sku: {
//     name: 'Standard_LRS'
//   }
//   kind: 'StorageV2'
// }]
