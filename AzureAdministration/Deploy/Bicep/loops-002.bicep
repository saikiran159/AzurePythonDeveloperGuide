param rgLocation string = resourceGroup().location // optional parameter
param storageCount int = 2 // optional parameter

// use range for loops, instead of looping through arrays
resource createStorages 'Microsoft.Storage/storageAccounts@2022-09-01' = [for i in range(0, storageCount): {
  name: '${i}storage${uniqueString(resourceGroup().id)}'
  location: rgLocation
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}]

output names array = [for i in range(0,storageCount) : {
  name: createStorages[i].name
} ]

// loop with condition

// ... '.../storageAccounts@2022-09-01' = [for i in range(0, storageCount): if(createNewStorage) {}

