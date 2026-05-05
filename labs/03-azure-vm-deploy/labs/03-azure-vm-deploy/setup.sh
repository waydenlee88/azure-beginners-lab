#!/bin/bash
# =============================================================
# Lab 03 — Deploy a Virtual Machine (Azure CLI version)
# By: cloudwithwayden | github.com/waydenlee88
# =============================================================
# WARNING: VMs cost money while running (~$0.05/hour for B1s).
# This script includes a cleanup command — always run it when done.
# =============================================================

# --- CONFIGURATION ---
RESOURCE_GROUP="lab-01-my-first-rg"
LOCATION="eastus"
VM_NAME="lab-03-my-first-vm"
VM_SIZE="Standard_B1s"          # Cheapest VM size
IMAGE="Ubuntu2204"               # Ubuntu Server 22.04 LTS
ADMIN_USER="azureuser"
NSG_NAME="lab-03-nsg"

echo "========================================"
echo " Azure Beginners Lab — Lab 03"
echo " Deploy a Virtual Machine"
echo "========================================"
echo ""
echo " WARNING: This lab costs ~\$0.05/hour."
echo " Remember to run the cleanup command when done!"
echo ""

# Step 1: Log in
echo "Step 1: Logging in to Azure..."
az login

# Step 2: Create the VM
echo ""
echo "Step 2: Creating Virtual Machine: $VM_NAME"
echo "        This takes 2-3 minutes..."
az vm create \
  --name $VM_NAME \
  --resource-group $RESOURCE_GROUP \
  --location $LOCATION \
  --image $IMAGE \
  --size $VM_SIZE \
  --admin-username $ADMIN_USER \
  --generate-ssh-keys \
  --tags environment=lab lab=03

# Step 3: Show VM details
echo ""
echo "Step 3: Getting VM details..."
az vm show \
  --name $VM_NAME \
  --resource-group $RESOURCE_GROUP \
  --show-details \
  --output table

# Step 4: Get the public IP
echo ""
echo "Step 4: Getting public IP address..."
PUBLIC_IP=$(az vm show \
  --name $VM_NAME \
  --resource-group $RESOURCE_GROUP \
  --show-details \
  --query publicIps \
  --output tsv)

echo ""
echo "========================================"
echo " SUCCESS! VM is running."
echo " VM Name    : $VM_NAME"
echo " Size       : $VM_SIZE"
echo " Public IP  : $PUBLIC_IP"
echo " Admin User : $ADMIN_USER"
echo "========================================"
echo ""
echo "To connect to your VM via SSH:"
echo "  ssh $ADMIN_USER@$PUBLIC_IP"
echo ""
echo "========================================"
echo " CLEANUP — Run this when done:"
echo "========================================"
echo "  az vm delete --name $VM_NAME --resource-group $RESOURCE_GROUP --yes --no-wait"
echo ""
echo " Or delete everything at once:"
echo "  az group delete --name $RESOURCE_GROUP --yes --no-wait"
echo ""
