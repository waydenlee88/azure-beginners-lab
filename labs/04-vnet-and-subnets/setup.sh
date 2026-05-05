#!/bin/bash
# =============================================================
# Lab 04 — Virtual Networks and Subnets (Azure CLI version)
# By: cloudwithwayden | github.com/waydenlee88
# =============================================================
# Cost: FREE — VNets and Subnets have no cost in Azure.
# =============================================================

# --- CONFIGURATION ---
RESOURCE_GROUP="lab-01-my-first-rg"
LOCATION="eastus"
VNET_NAME="lab-04-vnet"
VNET_PREFIX="10.0.0.0/16"
SUBNET_PUBLIC_NAME="subnet-public"
SUBNET_PUBLIC_PREFIX="10.0.1.0/24"
SUBNET_PRIVATE_NAME="subnet-private"
SUBNET_PRIVATE_PREFIX="10.0.2.0/24"

echo "========================================"
echo " Azure Beginners Lab — Lab 04"
echo " Virtual Networks and Subnets"
echo "========================================"

# Step 1: Log in
echo ""
echo "Step 1: Logging in to Azure..."
az login

# Step 2: Create the Virtual Network
echo ""
echo "Step 2: Creating Virtual Network: $VNET_NAME"
az network vnet create \
  --name $VNET_NAME \
  --resource-group $RESOURCE_GROUP \
  --location $LOCATION \
  --address-prefix $VNET_PREFIX \
  --tags environment=lab lab=04

echo ""
echo "VNet created: $VNET_NAME ($VNET_PREFIX)"

# Step 3: Create public subnet
echo ""
echo "Step 3: Creating public subnet: $SUBNET_PUBLIC_NAME"
az network vnet subnet create \
  --name $SUBNET_PUBLIC_NAME \
  --vnet-name $VNET_NAME \
  --resource-group $RESOURCE_GROUP \
  --address-prefix $SUBNET_PUBLIC_PREFIX

echo "Public subnet created: $SUBNET_PUBLIC_NAME ($SUBNET_PUBLIC_PREFIX)"

# Step 4: Create private subnet
echo ""
echo "Step 4: Creating private subnet: $SUBNET_PRIVATE_NAME"
az network vnet subnet create \
  --name $SUBNET_PRIVATE_NAME \
  --vnet-name $VNET_NAME \
  --resource-group $RESOURCE_GROUP \
  --address-prefix $SUBNET_PRIVATE_PREFIX

echo "Private subnet created: $SUBNET_PRIVATE_NAME ($SUBNET_PRIVATE_PREFIX)"

# Step 5: List all subnets to verify
echo ""
echo "Step 5: Verifying subnets..."
az network vnet subnet list \
  --vnet-name $VNET_NAME \
  --resource-group $RESOURCE_GROUP \
  --output table

echo ""
echo "========================================"
echo " SUCCESS! Network created."
echo " VNet            : $VNET_NAME"
echo " Address Space   : $VNET_PREFIX"
echo " Public Subnet   : $SUBNET_PUBLIC_NAME ($SUBNET_PUBLIC_PREFIX)"
echo " Private Subnet  : $SUBNET_PRIVATE_NAME ($SUBNET_PRIVATE_PREFIX)"
echo "========================================"
echo ""
echo "CLEANUP: When done, run:"
echo "  az network vnet delete --name $VNET_NAME --resource-group $RESOURCE_GROUP"
echo ""
