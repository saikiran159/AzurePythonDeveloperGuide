@minLength(3) // min length of storagePrefix
@maxLength(11) // max length of storagePrefix
param storagePrefix string // required parameter

@allowed([ // allowed values for storageSKU
  'Standard_LRS'
  'Standard_GRS'
  'Standard_RAGRS'
  'Standard_ZRS'
  'Premium_LRS'
  'Premium_ZRS'
  'Standard_GZRS'
  'Standard_RAGZRS'
])
param storageSKU string = 'Standard_LRS' // optional parameter

param location string // required parameter

var uniqueStorageName = '${storagePrefix}${uniqueString(resourceGroup().id)}' // variable doesn't need data type

resource stg 'Microsoft.Storage/storageAccounts@2021-04-01' = {
  name: uniqueStorageName
  location: location
  sku: {
    name: storageSKU
  }
  kind: 'StorageV2'
  properties: {
    supportsHttpsTrafficOnly: true
  }
}

output storageEndpoint object = stg.properties.primaryEndpoints // outputs
