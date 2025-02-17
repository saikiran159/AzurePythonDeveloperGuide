targetScope = 'managementGroup' // at management group level

@description('An Array of Target Management Group')
param targetMGs array // since we can create multiple management group in a managment group

@description('An array of the allowed locations, all other locations will be denied by the created policy.')
param allowedLocations array = [ // list of locations
  'australiaeast'
  'australiasoutheast'
  'australiacentral'
]

var policyDefinitionName = 'LocationRestriction' // policy name. can be anything but must be unique
resource policyDef 'Microsoft.Authorization/policyDefinitions@2020-09-01' = {
  name: policyDefinitionName  
  properties: {
    policyType: 'Custom' // custom policy
    mode: 'All'
    parameters: {}
    policyRule: {
      if: {
        not: {
          field: 'location'
          in: allowedLocations
        }
      }
      then: {
        effect: 'deny'
      }
    }
  }
}

module getManagementGroupNameDeploy './empty.bicep' = {
  // temporary fix
  // this is a no-op to get the name of the managementGroup for the policyDefintion, i.e. the name of the mg for this deployment'
  name: 'getManagementGroupName'
  scope: managementGroup()
}

module assignmentLoop './location-lock-assignment.bicep' = [for targetMG in targetMGs: {
  name: 'deploy-assignment-to-${targetMG}'
  scope: managementGroup(targetMG)
  params: {
    policyDefinitionId: extensionResourceId(tenantResourceId('Microsoft.Management/managementGroups', split(reference(getManagementGroupNameDeploy.name, '2020-10-01', 'Full').scope, '/')[2]), 'Microsoft.Authorization/policyDefinitions', policyDefinitionName)
  }
}]
