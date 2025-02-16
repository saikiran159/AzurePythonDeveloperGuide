param location string = resourceGroup().location // this is a parameter with type string
param appPlanName string  = '${uniqueString(resourceGroup().id)}plan'

resource appServicePlan 'Microsoft.Web/serverfarms@2020-12-01' = {
  name: appPlanName // parameters are assigned here
  location: location
  sku: {
    name: 'F1'
    capacity: 1
  }
}

resource storageaccount 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: '${appServicePlan.name}storage' // if we have done like this in ARM templates without dependson it will throw error.
  location: location                    // but here bicep compiler is intelligent enough to find the dependencies
  kind: 'StorageV2'
  sku: {
    name: 'Premium_LRS'
  }
}

// behind the scenes bicep files are converted to ARM template during deployment
// one more caveat is that we can using `az` tool from azure to convert existing ARM template to bicep file too. it is not 100% accurate, so manual inspection is required after conversion
