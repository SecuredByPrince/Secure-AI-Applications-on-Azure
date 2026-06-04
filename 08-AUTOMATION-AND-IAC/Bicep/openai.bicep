@description('Deployment location')
param location string

@description('Azure OpenAI resource name')
param openAIName string

@description('Resource tags')
param tags object = {}

resource openAI 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: openAIName
  location: location
  kind: 'OpenAI'

  tags: tags

  sku: {
    name: 'S0'
  }

  properties: {
    customSubDomainName: openAIName

    publicNetworkAccess: 'Enabled'

    networkAcls: {
  bypass: 'AzureServices'
  defaultAction: 'Allow'
}

    disableLocalAuth: false
  }
}

output openAIName string = openAI.name

output openAIEndpoint string = openAI.properties.endpoint
