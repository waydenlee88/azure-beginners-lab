#!/bin/bash
# =============================================================
# Lab 06 — RBAC and IAM (Azure CLI version)
# By: cloudwithwayden | github.com/waydenlee88
# =============================================================
# Cost: FREE — IAM and role assignments have no cost.
# =============================================================

# --- CONFIGURATION ---
RESOURCE_GROUP="lab-01-my-first-rg"

echo "========================================"
echo " Azure Beginners Lab — Lab 06"
echo " RBAC and IAM"
echo "========================================"

# Step 1: Log in
echo ""
echo "Step 1: Logging in to Azure..."
az login

# Step 2: Get your subscription ID and current user
echo ""
echo "Step 2: Getting account info..."
SUBSCRIPTION_ID=$(az account show --query id --output tsv)
CURRENT_USER=$(az account show --query user.name --output tsv)
echo "Subscription : $SUBSCRIPTION_ID"
echo "Logged in as : $CURRENT_USER"

# Step 3: List all role assignments in your Resource Group
echo ""
echo "Step 3: Current role assignments in $RESOURCE_GROUP:"
az role assignment list \
  --resource-group $RESOURCE_GROUP \
  --output table

# Step 4: List all built-in roles (first 20)
echo ""
echo "Step 4: Available built-in roles (showing first 20):"
az role definition list \
  --query "[?roleType=='BuiltInRole'].{Name:roleName, Description:description}" \
  --output table | head -25

# Step 5: View details of the Reader role
echo ""
echo "Step 5: Reader role permissions (summary):"
az role definition list \
  --name "Reader" \
  --output json | grep -E '"description"|"roleName"' | head -5

# Step 6: Check your own permissions on the Resource Group
echo ""
echo "Step 6: Your current permissions on $RESOURCE_GROUP:"
az role assignment list \
  --assignee $CURRENT_USER \
  --resource-group $RESOURCE_GROUP \
  --output table

# Step 7: Assign a role (COMMENTED OUT — uncomment only if needed)
echo ""
echo "Step 7: Role assignment example (commented out for safety)"
echo "        To assign a Reader role, uncomment the lines below:"
echo ""
echo "  # TARGET_USER='user@example.com'"
echo "  # az role assignment create \\"
echo "  #   --assignee \$TARGET_USER \\"
echo "  #   --role 'Reader' \\"
echo "  #   --resource-group $RESOURCE_GROUP"

# Uncomment below to actually assign a role:
# TARGET_USER="user@example.com"
# az role assignment create \
#   --assignee $TARGET_USER \
#   --role "Reader" \
#   --resource-group $RESOURCE_GROUP

echo ""
echo "========================================"
echo " SUCCESS! IAM review complete."
echo " You can see all role assignments above."
echo "========================================"
echo ""
echo "NOTE: No resources were created in this lab."
echo "      Nothing to clean up!"
echo ""
