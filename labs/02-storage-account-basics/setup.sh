#!/bin/bash
# =============================================================
# Lab 02 — Storage Account Basics (Azure CLI version)
# By: cloudwithwayden | github.com/waydenlee88
# =============================================================
# OPTIONAL: This script does the same as the portal steps.
# Run it after Lab 08 (Azure CLI Basics) to compare methods.
# =============================================================

# --- CONFIGURATION ---
RESOURCE_GROUP="lab-01-my-first-rg"
LOCATION="eastus"
STORAGE_ACCOUNT="labstorage$RANDOM"   # Random suffix for uniqueness
CONTAINER_NAME="my-first-container"
UPLOAD_FILE="test-file.txt"           # We'll create this below

echo "========================================"
echo " Azure Beginners Lab — Lab 02"
echo " Storage Account Basics"
echo "========================================"

# Step 1: Log in
echo ""
echo "Step 1: Logging in to Azure..."
az login

# Step 2: Create storage account
echo ""
echo "Step 2: Creating Storage Account: $STORAGE_ACCOUNT"
az storage account create \
  --name $STORAGE_ACCOUNT \
  --resource-group $RESOURCE_GROUP \
  --location $LOCATION \
  --sku Standard_LRS \
  --kind StorageV2 \
  --tags environment=lab lab=02

echo ""
echo "Storage account created: $STORAGE_ACCOUNT"

# Step 3: Get the connection string
echo ""
echo "Step 3: Getting connection string..."
CONN_STRING=$(az storage account show-connection-string \
  --name $STORAGE_ACCOUNT \
  --resource-group $RESOURCE_GROUP \
  --query connectionString \
  --output tsv)

# Step 4: Create a container
echo ""
echo "Step 4: Creating container: $CONTAINER_NAME"
az storage container create \
  --name $CONTAINER_NAME \
  --connection-string $CONN_STRING

# Step 5: Create a test file and upload it
echo ""
echo "Step 5: Creating and uploading a test file..."
echo "Hello from Azure Beginners Lab! Lab 02 - Storage Account" > $UPLOAD_FILE

az storage blob upload \
  --container-name $CONTAINER_NAME \
  --file $UPLOAD_FILE \
  --name $UPLOAD_FILE \
  --connection-string $CONN_STRING

# Step 6: List blobs to verify
echo ""
echo "Step 6: Listing blobs in container..."
az storage blob list \
  --container-name $CONTAINER_NAME \
  --connection-string $CONN_STRING \
  --output table

# Step 7: Show the blob URL
echo ""
echo "Step 7: Your file URL:"
echo "https://$STORAGE_ACCOUNT.blob.core.windows.net/$CONTAINER_NAME/$UPLOAD_FILE"

echo ""
echo "========================================"
echo " SUCCESS! Lab 02 complete."
echo " Storage Account : $STORAGE_ACCOUNT"
echo " Container       : $CONTAINER_NAME"
echo " File Uploaded   : $UPLOAD_FILE"
echo "========================================"
echo ""
echo "CLEANUP: When done, run:"
echo "  az storage account delete --name $STORAGE_ACCOUNT --resource-group $RESOURCE_GROUP --yes"
echo ""

# Clean up local test file
rm -f $UPLOAD_FILE
