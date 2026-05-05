#!/bin/bash
# =============================================================
# Lab 05 — Azure Monitor Basics (Azure CLI version)
# By: cloudwithwayden | github.com/waydenlee88
# =============================================================
# Cost: FREE — Azure Monitor basics are included at no cost.
# =============================================================

# --- CONFIGURATION ---
RESOURCE_GROUP="lab-01-my-first-rg"
LOCATION="eastus"
ACTION_GROUP_NAME="lab-alert-group"
ALERT_RULE_NAME="lab-05-storage-alert"

# !! Replace with your email address !!
YOUR_EMAIL="your-email@example.com"

# !! Replace with your storage account name from Lab 02 !!
STORAGE_ACCOUNT_NAME="your-storage-account-name"

echo "========================================"
echo " Azure Beginners Lab — Lab 05"
echo " Azure Monitor Basics"
echo "========================================"
echo ""
echo " Before running: update YOUR_EMAIL and"
echo " STORAGE_ACCOUNT_NAME at the top of this script."
echo ""

# Step 1: Log in
echo "Step 1: Logging in to Azure..."
az login

# Step 2: Get your subscription ID
echo ""
echo "Step 2: Getting subscription ID..."
SUBSCRIPTION_ID=$(az account show --query id --output tsv)
echo "Subscription: $SUBSCRIPTION_ID"

# Step 3: Create an Action Group (where alerts get sent)
echo ""
echo "Step 3: Creating Action Group: $ACTION_GROUP_NAME"
az monitor action-group create \
  --name $ACTION_GROUP_NAME \
  --resource-group $RESOURCE_GROUP \
  --short-name "LabAlerts" \
  --email-receiver \
      name="EmailAlert" \
      email-address="$YOUR_EMAIL"

echo "Action Group created — alerts will go to: $YOUR_EMAIL"

# Step 4: Get the storage account resource ID
echo ""
echo "Step 4: Getting storage account resource ID..."
STORAGE_ID=$(az storage account show \
  --name $STORAGE_ACCOUNT_NAME \
  --resource-group $RESOURCE_GROUP \
  --query id \
  --output tsv)

echo "Storage Account ID: $STORAGE_ID"

# Step 5: Get the action group ID
ACTION_GROUP_ID=$(az monitor action-group show \
  --name $ACTION_GROUP_NAME \
  --resource-group $RESOURCE_GROUP \
  --query id \
  --output tsv)

# Step 6: Create an alert rule
echo ""
echo "Step 5: Creating Alert Rule: $ALERT_RULE_NAME"
az monitor metrics alert create \
  --name $ALERT_RULE_NAME \
  --resource-group $RESOURCE_GROUP \
  --scopes $STORAGE_ID \
  --condition "total transactions > 100" \
  --window-size 5m \
  --evaluation-frequency 1m \
  --severity 2 \
  --description "Alert when storage transactions exceed 100" \
  --action $ACTION_GROUP_ID

echo ""
echo "========================================"
echo " SUCCESS! Monitor alert created."
echo " Action Group : $ACTION_GROUP_NAME"
echo " Alert Rule   : $ALERT_RULE_NAME"
echo " Alerts sent  : $YOUR_EMAIL"
echo "========================================"
echo ""
echo "CLEANUP: When done, run:"
echo "  az monitor metrics alert delete --name $ALERT_RULE_NAME --resource-group $RESOURCE_GROUP"
echo "  az monitor action-group delete --name $ACTION_GROUP_NAME --resource-group $RESOURCE_GROUP"
echo ""
