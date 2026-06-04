targetScope = 'resourceGroup'

@description('Deployment location')
param location string = resourceGroup().location

@description('Environment tags')
param tags object = {
  Environment: 'Lab'
  Project: 'Secure-AI-Applications-on-Azure'
}

//
// Monitoring Module
//
module monitoring './monitoring.bicep' = {
  name: 'monitoringDeployment'

  params: {
    location: location
    tags: tags
  }
}

//
// Key Vault Module
//
module keyvault './keyvault.bicep' = {
  name: 'keyVaultDeployment'

  params: {
    location: location
    keyVaultName: 'kv-secure-ai'
    tags: tags
    openAIApiKey: 'temporary-demo-key'
  }
}

//
// OpenAI Module
//
module openAIDeployment './openai.bicep' = {
  name: 'openAIDeployment'

  params: {
    location: location

    openAIName: 'openai-secure-ai'

    tags: tags
  }
}

//
// Outputs
//
output workspaceId string = monitoring.outputs.workspaceId

output workspaceName string = monitoring.outputs.workspaceName

output applicationInsightsName string = monitoring.outputs.applicationInsightsName

output keyVaultUri string = keyvault.outputs.keyVaultUri

output openAIEndpoint string = openAIDeployment.outputs.openAIEndpoint
