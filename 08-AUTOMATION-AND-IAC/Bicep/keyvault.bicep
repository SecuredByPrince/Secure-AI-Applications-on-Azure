param location string
param keyVaultName string
param tags object = {}

@secure()
param openAIApiKey string

resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: keyVaultName
  location: location

  tags: tags

  properties: {
    tenantId: tenant().tenantId

    sku: {
      family: 'A'
      name: 'standard'
    }

    enableRbacAuthorization: true
    enabledForDeployment: true
    enabledForTemplateDeployment: true
    enabledForDiskEncryption: true

    publicNetworkAccess: 'Enabled'

    networkAcls: {
      bypass: 'AzureServices'
      defaultAction: 'Allow'
    }

    softDeleteRetentionInDays: 90
    enableSoftDelete: true
    enablePurgeProtection: true
  }
}

resource openAISecret 'Microsoft.KeyVault/vaults/secrets@2023-02-01' = {
  name: 'openai-api-key'
  parent: keyVault

  properties: {
    value: openAIApiKey
  }
}

output keyVaultName string = keyVault.name
output keyVaultUri string = keyVault.properties.vaultUri

