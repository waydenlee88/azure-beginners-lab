#!/bin/bash
# =============================================================
# Lab 01 — Create a Resource Group (Azure CLI version)
# By: cloudwithwayden | github.com/waydenlee88
# =============================================================
# OPTIONAL: This script does the same as the portal steps.
# You don't need to run this to complete Lab 01.
# Come back to it after finishing Lab 08 (Azure CLI Basics).
# =============================================================

# --- CONFIGURATION ---
# Change these values if you want a different name or location
RESOURCE_GROUP_NAME="lab-01-my-first-rg"
LOCATION="eastus"

echo "========================================"
echo " Azure Beginners Lab — Lab 01"
echo " Creating Resource Group..."
echo "========================================"

# Step 1: Log in to Azure (this opens a browser window)
echo ""
echo "Step 1: Logging in to Azure..."
az login

# Step 2: Create the Resource Group
echo ""
echo "Step 2: Creating Resource Group: $RESOURCE_GROUP_NAME"
az group create \
  --name $RESOURCE_GROUP_NAME \
  --location $LOCATION \
  --tags environment=lab owner=cloudwithwayden

# Step 3: Verify it was created
echo ""
echo "Step 3: Verifying..."
az group show --name $RESOURCE_GROUP_NAME

echo ""
echo "========================================"
echo " SUCCESS! Resource Group created."
echo " Name: $RESOURCE_GROUP_NAME"
echo " Location: $LOCATION"
echo "========================================"
echo ""
echo "CLEANUP: When you're done, run:"
echo "  az group delete --name $RESOURCE_GROUP_NAME --yes --no-wait"
echo ""
