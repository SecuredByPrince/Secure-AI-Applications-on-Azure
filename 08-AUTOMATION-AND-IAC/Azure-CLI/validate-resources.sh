#!/bin/bash

set -e

# ==========================================
# Secure AI Applications on Azure
# Resource Validation Script
# ==========================================

echo "=========================================="
echo "Secure AI Applications on Azure"
echo "Infrastructure Validation Automation"
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

#
# Validate Resource Group
#
echo ""
echo "Checking Resource Group..."

az group show \
  --name $RESOURCE_GROUP \
  --output table

#
# Validate Azure OpenAI Resources
#
echo ""
echo "Checking Azure OpenAI resources..."

az cognitiveservices account list \
  --resource-group $RESOURCE_GROUP \
  --query "[].{Name:name, Location:location, Kind:kind}" \
  --output table

#
# Validate Key Vault Resources
#
echo ""
echo "Checking Key Vault resources..."

az keyvault list \
  --resource-group $RESOURCE_GROUP \
  --query "[].{Name:name, Location:location}" \
  --output table

#
# Validate Log Analytics Workspace
#
echo ""
echo "Checking Log Analytics workspaces..."

az monitor log-analytics workspace list \
  --resource-group $RESOURCE_GROUP \
  --query "[].{Name:name, Location:location}" \
  --output table

#
# Validate Application Insights
#
echo ""
echo "Checking Application Insights resources..."

az monitor app-insights component show \
  --app appi-secure-ai \
  --resource-group $RESOURCE_GROUP \
  --output table

#
# Validate Microsoft Sentinel Solutions
#
echo ""
echo "Checking Microsoft Sentinel solutions..."

az resource list \
  --resource-group $RESOURCE_GROUP \
  --query "[?contains(type, 'SecurityInsights')].[name,type]" \
  --output table

#
# Validate Deployment Inventory
#
echo ""
echo "Listing all deployed resources..."

az resource list \
  --resource-group $RESOURCE_GROUP \
  --query "[].{Name:name, Type:type, Location:location}" \
  --output table

#
# Validate Recent Deployments
#
echo ""
echo "Checking deployment history..."

az deployment group list \
  --resource-group $RESOURCE_GROUP \
  --query "[].{Deployment:name, State:properties.provisioningState}" \
  --output table

#
# Completion Message
#
echo ""
echo "=========================================="
echo "Resource validation completed successfully."
echo "=========================================="