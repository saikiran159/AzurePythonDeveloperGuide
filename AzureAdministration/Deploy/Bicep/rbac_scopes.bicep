param location string = resourceGroup().location
param storageAccountName string = 'stor${uniqueString(resourceGroup().id)}'
param storageSkuName string = 'Standard_LRS'
param roleDefinitionResourceId string
param principalId string

resource storageAccount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: storageAccountName
  location: location
  kind: 'StorageV2'
  sku: {
   name: storageSkuName
  }
}

resource roleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: storageAccount // role assignment for storage account
  name: guid(storageAccount.id, principalId, roleDefinitionResourceId)
  properties: {
    roleDefinitionId: roleDefinitionResourceId // you can get id for all roles avaialable in azure
    principalId: principalId // principal id, you can check this in entra id
    principalType: 'ServicePrincipal' // possible values: User, Group, Device, ServicePrincipal
  }
}
