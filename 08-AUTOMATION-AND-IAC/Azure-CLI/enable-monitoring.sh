#!/bin/bash

set -e

# ==========================================
# Secure AI Applications on Azure
# Monitoring Enablement Script
# ==========================================

echo "=========================================="
echo "Secure AI Applications on Azure"
echo "Monitoring Infrastructure Automation"
echo "=========================================="

#
# Validate Azure Login
#
echo ""
echo "Validating Azure login..."

az account show --output table

if [ $? -ne 0 ]; then
  echo "Azure login not found."
  exit 1
fi

#
# Variables
#
RESOURCE_GROUP="rg-secure-ai"
LOCATION="eastus"

LOG_ANALYTICS_NAME="law-secure-ai"
APP_INSIGHTS_NAME="appi-secure-ai"

#
# Create Resource Group
#
echo ""
echo "Ensuring Resource Group exists..."

az group create \
  --name $RESOURCE_GROUP \
  --location $LOCATION \
  --output table

#
# Create Log Analytics Workspace
#
echo ""
echo "Creating Log Analytics Workspace..."

az monitor log-analytics workspace create \
  --resource-group $RESOURCE_GROUP \
  --workspace-name $LOG_ANALYTICS_NAME \
  --location $LOCATION \
  --tags Environment=Lab Project=Secure-AI \
  --output table

#
# Retrieve Workspace ID
#
echo ""
echo "Retrieving Log Analytics Workspace ID..."

WORKSPACE_ID=$(az monitor log-analytics workspace show \
  --resource-group $RESOURCE_GROUP \
  --workspace-name $LOG_ANALYTICS_NAME \
  --query id \
  --output tsv)

echo "Workspace ID retrieved successfully."

#
# Create Application Insights
#
echo ""
echo "Creating Application Insights..."

az monitor app-insights component create \
  --app $APP_INSIGHTS_NAME \
  --location $LOCATION \
  --resource-group $RESOURCE_GROUP \
  --workspace $WORKSPACE_ID \
  --application-type web \
  --tags Environment=Lab Project=Secure-AI \
  --output table

#
# Validate Monitoring Resources
#
echo ""
echo "Validating monitoring resources..."

az resource list \
  --resource-group $RESOURCE_GROUP \
  --query "[?contains(type, 'OperationalInsights') || contains(type, 'Insights')].[name,type]" \
  --output table

#
# Retrieve Log Analytics Workspace Details
#
echo ""
echo "Retrieving Log Analytics Workspace details..."

az monitor log-analytics workspace show \
  --resource-group $RESOURCE_GROUP \
  --workspace-name $LOG_ANALYTICS_NAME \
  --output table

#
# Retrieve Application Insights Details
#
echo ""
echo "Retrieving Application Insights details..."

az monitor app-insights component show \
  --app $APP_INSIGHTS_NAME \
  --resource-group $RESOURCE_GROUP \
  --output table

#
# Completion Message
#
echo ""
echo "=========================================="
echo "Monitoring configuration completed successfully."
echo "=========================================="