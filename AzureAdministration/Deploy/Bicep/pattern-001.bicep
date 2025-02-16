@description('The location into which your Azure resources should be deployed.') // description of parameter
param location string = resourceGroup().location // optional parameter

@description('Select the type of environment you want to provision. Allowed values are Production and NonProduction.')
@allowed([ // allowed values for the parameter are Production and NonProduction
  'Production'
  'NonProduction'
])
param environmentType string = 'NonProduction' //  optional parameter

param storageAccountName string = 'stor${uniqueString(resourceGroup().id)}' // optional parameter
param appServiceAppName string = 'app${uniqueString(resourceGroup().id)}' // optional parameter

var appServicePlanName = 'MyAppServicePlan' // variable doesn't need any data type

var environmentConfigurationMap = { // create an object
  Production: {
    appServicePlan: {
      sku: {
        name: 'P2V3'
        capacity: 3
      }
    }
    appServiceApp: {
      alwaysOn: false
    }
    storageAccount: {
      sku: {
        name: 'Standard_ZRS'
      }
    }
  }
  NonProduction: {
    appServicePlan: {
      sku: {
        name: 'S2'
        capacity: 1
      }
    }
    appServiceApp: {
      alwaysOn: false
    }
    storageAccount: {
      sku: {
        name: 'Standard_LRS'
      }
    }
  }
}

resource appServicePlan 'Microsoft.Web/serverfarms@2022-09-01' = { // creates a new app service plan
  name: appServicePlanName
  location: location
  sku: environmentConfigurationMap[environmentType].appServicePlan.sku // selects SKU from object based on input parameter value
}

resource appServiceApp 'Microsoft.Web/sites@2022-09-01' = { // create an app
  name: appServiceAppName
  location: location
  properties: {
    serverFarmId: appServicePlan.id
    httpsOnly: true
    siteConfig: {
      alwaysOn: environmentConfigurationMap[environmentType].appServiceApp.alwaysOn
    }
  }
}

resource storageAccount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: storageAccountName
  location: location
  kind: 'StorageV2'
  sku: environmentConfigurationMap[environmentType].storageAccount.sku
}
