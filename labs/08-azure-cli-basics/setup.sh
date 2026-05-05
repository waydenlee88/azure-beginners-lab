#!/bin/bash
# =============================================================
# Lab 08 — Azure CLI Basics (Capstone Script)
# By: cloudwithwayden | github.com/waydenlee88
# =============================================================
# This script is your CLI capstone. It recreates the key
# resources from Labs 01-04 using only command-line commands.
# Compare each command to what you did in the Portal.
# =============================================================

# --- CONFIGURATION ---
RESOURCE_GROUP="lab-08-cli-rg"
LOCATION="eastus"
STORAGE_ACCOUNT="labcli$RANDOM"
CONTAINER_NAME="cli-container"
VNET_NAME="lab-cli-vnet"
SUBNET_PUBLIC="subnet-public"
SUBNET_PRIVATE="subnet-private"

echo "========================================"
echo " Azure Beginners Lab — Lab 08"
echo " Azure CLI Capstone Script"
echo "========================================"
echo ""
echo " This script recreates Labs 01-04 using CLI only."
echo " Watch each command and compare to the Portal steps."
echo ""

# Step 1: Log in
echo "Step 1: Logging in to Azure..."
az login

echo ""
echo "Logged in. Showing account details:"
az account show --output table

# ---- LAB 01: Resource Group ----
echo ""
echo "========================================"
echo " Recreating Lab 01 — Resource Group"
echo "========================================"

az group create \
  --name $RESOURCE_GROUP \
  --location $LOCATION \
  --tags environment=lab lab=08

echo "Resource Group created: $RESOURCE_GROUP"

# Verify
az group show \
  --name $RESOURCE_GROUP \
  --output table

# ---- LAB 02: Storage Account ----
echo ""
echo "========================================"
echo " Recreating Lab 02 — Storage Account"
echo "========================================"

az storage account create \
  --name $STORAGE_ACCOUNT \
  --resource-group $RESOURCE_GROUP \
  --location $LOCATION \
  --sku Standard_LRS \
  --kind StorageV2 \
  --tags environment=lab lab=08

echo "Storage Account created: $STORAGE_ACCOUNT"

# Create a container
CONN_STRING=$(az storage account show-connection-string \
  --name $STORAGE_ACCOUNT \
  --resource-group $RESOURCE_GROUP \
  --query connectionString \
  --output tsv)

az storage container create \
  --name $CONTAINER_NAME \
  --connection-string $CONN_STRING

echo "Container created: $CONTAINER_NAME"

# Upload a test file
echo "Hello from Lab 08 CLI Capstone!" > capstone-test.txt
az storage blob upload \
  --container-name $CONTAINER_NAME \
  --file capstone-test.txt \
  --name capstone-test.txt \
  --connection-string $CONN_STRING

echo "File uploaded to blob storage"
rm -f capstone-test.txt

# ---- LAB 04: VNet and Subnets ----
echo ""
echo "========================================"
echo " Recreating Lab 04 — VNet and Subnets"
echo "========================================"

az network vnet create \
  --name $VNET_NAME \
  --resource-group $RESOURCE_GROUP \
  --location $LOCATION \
  --address-prefix 10.0.0.0/16 \
  --tags environment=lab lab=08

az network vnet subnet create \
  --name $SUBNET_PUBLIC \
  --vnet-name $VNET_NAME \
  --resource-group $RESOURCE_GROUP \
  --address-prefix 10.0.1.0/24

az network vnet subnet create \
  --name $SUBNET_PRIVATE \
  --vnet-name $VNET_NAME \
  --resource-group $RESOURCE_GROUP \
  --address-prefix 10.0.2.0/24

echo "VNet and subnets created: $VNET_NAME"

# ---- SUMMARY ----
echo ""
echo "========================================"
echo " ALL DONE! Here's what was created:"
echo "========================================"
echo ""
echo " Listing all resources in $RESOURCE_GROUP:"
az resource list \
  --resource-group $RESOURCE_GROUP \
  --output table

echo ""
echo "========================================"
echo " CONGRATULATIONS!"
echo " You've completed all 8 Azure labs."
echo " You recreated Labs 01-04 with pure CLI."
echo "========================================"
echo ""
echo " Follow cloudwithwayden for more labs:"
echo " https://github.com/waydenlee88"
echo ""
echo "========================================"
echo " CLEANUP — Run this when done:"
echo "========================================"
echo ""
echo "  az group delete --name $RESOURCE_GROUP --yes --no-wait"
echo ""
echo " This deletes EVERYTHING in the resource group at once."
echo ""
