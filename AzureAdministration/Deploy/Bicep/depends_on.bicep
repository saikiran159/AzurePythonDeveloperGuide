param location string = resourceGroup().location // optional parameter
param serviceBusNamespaceName string = 'myapp${uniqueString(resourceGroup().id)}' // optional parameter
param skuName string = 'Basic' // optional parameter

param queueNames array = [ // optional parameter
  'queue1'
  'queue2'
]

var deadLetterFirehoseQueueName = 'deadletterfirehose'

resource serviceBusNamespace 'Microsoft.ServiceBus/namespaces@2022-10-01-preview' = { // creates a service bus namespace
  name: serviceBusNamespaceName
  location: location
  sku: {
    name: skuName
  }
}

resource deadLetterFirehoseQueue 'Microsoft.ServiceBus/namespaces/queues@2022-10-01-preview' = {
  name: deadLetterFirehoseQueueName
  parent: serviceBusNamespace
  properties: {
    requiresDuplicateDetection: false
    requiresSession: false
    enablePartitioning: false
  }
}

resource queues 'Microsoft.ServiceBus/namespaces/queues@2022-10-01-preview' = [for queueName in queueNames: {
  parent: serviceBusNamespace
  name: queueName
  dependsOn: [
    deadLetterFirehoseQueue // only if this resource is deployed, this resource will start its deployment
  ]
  properties: {
    forwardDeadLetteredMessagesTo: deadLetterFirehoseQueueName
  }
}]
