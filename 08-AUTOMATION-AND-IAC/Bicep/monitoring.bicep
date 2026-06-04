@description('Deployment location')
param location string

@description('Log Analytics Workspace Name')
param workspaceName string

@description('Application Insights Name')
param appInsightsName string

@description('Resource tags')
param tags object = {}

//
// Log Analytics Workspace
//
resource logAnalytics 'Microsoft.OperationalInsights/workspaces@2022-10-01' = {
  name: workspaceName
  location: location

  tags: tags

  properties: {
    sku: {
      name: 'PerGB2018'
    }

    retentionInDays: 30
  }
}

//
// Application Insights
//
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: appInsightsName
  location: location
  kind: 'web'

  tags: tags

  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: logAnalytics.id
  }
}

//
// Outputs
//
output workspaceId string = logAnalytics.id

output workspaceName string = logAnalytics.name

output applicationInsightsName string = appInsights.name
