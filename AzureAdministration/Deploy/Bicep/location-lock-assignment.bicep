targetScope = 'managementGroup' // scope is defined here

@description('Policy definition unique identifier')
param policyDefinitionId string // policy id, mandatory param

resource policyAssignment 'Microsoft.Authorization/policyAssignments@2020-09-01' = {
  name: 'location-lock'
  properties: {
    policyDefinitionId: policyDefinitionId
  }
}
