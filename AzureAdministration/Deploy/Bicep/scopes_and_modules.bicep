targetScope = 'subscription' // scoped to subscription

@minLength(3)
@maxLength(11)
param namePrefix string

resource demoRG 'Microsoft.Resources/resourceGroups@2021-04-01'existing = { // existing means resource group is already present. if i want new resource group, then we wont mention `existing`
  name: 'demogroup1'
}

module stgModule 'storage_account.bicep' = {
  name: 'storageDeploy' // name of the deployment
  scope: demoRG // scope is resource group
  params: { // parameters defined in storage_account.bicep file to run
    storagePrefix: namePrefix
    location: demoRG.location
  }
}

output storageEndpoint object = stgModule.outputs.storageEndpoint
