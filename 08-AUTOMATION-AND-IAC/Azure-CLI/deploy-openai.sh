#!/bin/bash

set -e

# ==========================================
# Secure AI Applications on Azure
# Azure OpenAI Deployment Script
# ==========================================

echo "=========================================="
echo "Secure AI Applications on Azure"
echo "Azure OpenAI Deployment Automation"
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
OPENAI_NAME="openai-secure-ai-$RANDOM"

#
# Create Resource Group
#
echo ""
echo "Creating Resource Group..."

az group create \
  --name $RESOURCE_GROUP \
  --location $LOCATION \
  --output table

#
# Deploy Azure OpenAI Service
#
echo ""
echo "Deploying Azure OpenAI Service..."

az cognitiveservices account create \
  --name $OPENAI_NAME \
  --resource-group $RESOURCE_GROUP \
  --location $LOCATION \
  --kind OpenAI \
  --sku S0 \
  --custom-domain $OPENAI_NAME \
  --yes \
  --tags Environment=Lab Project=Secure-AI

#
# Validate Deployment Status
#
echo ""
echo "Validating deployment status..."

az cognitiveservices account show \
  --name $OPENAI_NAME \
  --resource-group $RESOURCE_GROUP \
  --query "{Name:name, Location:location, ProvisioningState:properties.provisioningState}" \
  --output table

#
# Retrieve Endpoint
#
echo ""
echo "Retrieving OpenAI endpoint..."

az cognitiveservices account show \
  --name $OPENAI_NAME \
  --resource-group $RESOURCE_GROUP \
  --query properties.endpoint \
  --output table

#
# Retrieve API Keys
#
echo ""
echo "Retrieving API Keys..."

az cognitiveservices account keys list \
  --name $OPENAI_NAME \
  --resource-group $RESOURCE_GROUP \
  --output table

#
# List Available Model Deployments
#
echo ""
echo "Listing available deployments..."

az cognitiveservices account deployment list \
  --name $OPENAI_NAME \
  --resource-group $RESOURCE_GROUP \
  --output table

#
# Completion Message
#
echo ""
echo "=========================================="
echo "Azure OpenAI deployment completed successfully."
echo "=========================================="