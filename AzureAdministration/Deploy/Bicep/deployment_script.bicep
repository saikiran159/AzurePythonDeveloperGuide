param identity string // required parameter
param utcValue string = utcNow() // optional parameter
param storageAccountName string = 'mystore' // optional parameter

// We have used deployment scripts in ARM templates. check out there to compare both
resource runPowerShellInline 'Microsoft.Resources/deploymentScripts@2020-10-01' = {
  name: 'runPowerShellInline' // name of the deployment
  location: resourceGroup().location // location is resolved from resouce group
  kind: 'AzurePowerShell' // We can choose over azure powershell or azure cli
  identity: { // identity of the script
    type: 'UserAssigned' // user created identity
    userAssignedIdentities: {
      '/subscriptions/01234567-89AB-CDEF-0123-456789ABCDEF/resourceGroups/myResourceGroup/providers/Microsoft.ManagedIdentity/userAssignedIdentities/myID': {}
    }
  }
  properties: {
    forceUpdateTag: '1' // change this to another value to deploy again.
    containerSettings: { // deployment script need ACI (azure container instance)
      containerGroupName: 'mycustomaci'
    }
    storageAccountSettings: { // deployment script also need storage account
      storageAccountName: 'myStorageAccount'
      storageAccountKey: 'myKey'
    }
    azPowerShellVersion: '8.3' // or "azCliVersion": "2.0.80",
    arguments: '-name \\"John Dole\\"'
    environmentVariables: [ // environment variables passed for execution of script
      {
        name: 'UserName'
        value: 'jdole'
      }
      {
        name: 'Password'
        secureValue: 'jDolePassword'
      }
    ]
    // azure powershell script content
    scriptContent: '''
      param([string] $name)
      $output = \'Hello {0}. The username is {1}, the password is {2}.\' -f $name,\${Env:UserName},\${Env:Password}
      Write-Output $output
      $DeploymentScriptOutputs = @{}
      $DeploymentScriptOutputs[\'text\'] = $output
    ''' // or "primaryScriptUri": "https://raw.githubusercontent.com/Azure/azure-docs-json-samples/master/deployment-script/deploymentscript-helloworld.ps1",
    supportingScriptUris: []
    timeout: 'PT30M' // this script has to complete it's task within 30 minutes
    cleanupPreference: 'OnSuccess' // cleanup ACI and storage account after script is successfully executed and after retentioninterval (1 day)
    retentionInterval: 'P1D'
  }
}
