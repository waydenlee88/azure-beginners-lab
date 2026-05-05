#!/bin/bash
# =============================================================
# Lab 07 — Cost Management (Azure CLI version)
# By: cloudwithwayden | github.com/waydenlee88
# =============================================================
# Cost: FREE — Cost Management features are free to use.
# =============================================================

# --- CONFIGURATION ---
# !! Replace with your email address !!
YOUR_EMAIL="your-email@example.com"

BUDGET_NAME="lab-monthly-budget"
BUDGET_AMOUNT=10        # $10 monthly budget
ALERT_80=80             # Alert at 80% ($8)
ALERT_100=100           # Alert at 100% ($10)

echo "========================================"
echo " Azure Beginners Lab — Lab 07"
echo " Cost Management"
echo "========================================"
echo ""
echo " Before running: update YOUR_EMAIL at the top of this script."
echo ""

# Step 1: Log in
echo "Step 1: Logging in to Azure..."
az login

# Step 2: Get subscription details
echo ""
echo "Step 2: Getting subscription info..."
SUBSCRIPTION_ID=$(az account show --query id --output tsv)
SUBSCRIPTION_NAME=$(az account show --query name --output tsv)
echo "Subscription: $SUBSCRIPTION_NAME ($SUBSCRIPTION_ID)"

# Step 3: View current spending
echo ""
echo "Step 3: Checking current month spending..."
START_DATE=$(date -d "$(date +%Y-%m-01)" +%Y-%m-%d 2>/dev/null || date -v1d +%Y-%m-%d)
END_DATE=$(date +%Y-%m-%d)

echo "Cost analysis from $START_DATE to $END_DATE:"
az consumption usage list \
  --start-date $START_DATE \
  --end-date $END_DATE \
  --query "[].{Service:instanceName, Cost:pretaxCost, Currency:currency}" \
  --output table 2>/dev/null || echo "  (No usage data yet — new account)"

# Step 4: Create a budget
echo ""
echo "Step 4: Creating budget: $BUDGET_NAME (\$$BUDGET_AMOUNT/month)"

# Set budget dates
BUDGET_START=$(date -d "$(date +%Y-%m-01)" +%Y-%m-%dT00:00:00Z 2>/dev/null || \
               date -v1d +%Y-%m-%dT00:00:00Z)
BUDGET_END="2099-12-31T00:00:00Z"

az consumption budget create \
  --budget-name $BUDGET_NAME \
  --amount $BUDGET_AMOUNT \
  --time-grain Monthly \
  --time-period start=$BUDGET_START end=$BUDGET_END \
  --category Cost \
  --notification \
    enabled=true \
    operator=GreaterThan \
    threshold=$ALERT_80 \
    contact-emails="[$YOUR_EMAIL]" \
    threshold-type=Actual \
  2>/dev/null && echo "Budget created successfully" || \
  echo "  Note: Budget creation via CLI may require additional permissions."
  echo "  If this fails, create the budget in the Azure Portal (see README)."

# Step 5: Show cost-saving tips
echo ""
echo "========================================"
echo " TOP COST-SAVING TIPS"
echo "========================================"
echo ""
echo "  1. Always delete resources after labs"
echo "     az group delete --name [rg-name] --yes --no-wait"
echo ""
echo "  2. Use B1s VMs for learning (cheapest)"
echo "     --size Standard_B1s"
echo ""
echo "  3. Use Standard_LRS storage (cheapest)"
echo "     --sku Standard_LRS"
echo ""
echo "  4. Enable VM auto-shutdown"
echo "     az vm auto-shutdown -g [rg] -n [vm] --time 1900"
echo ""
echo "  5. Check your spending anytime:"
echo "     az consumption usage list --output table"
echo ""
echo "========================================"
echo " SUCCESS! Cost Management setup complete."
echo " Budget  : $BUDGET_NAME"
echo " Amount  : \$$BUDGET_AMOUNT/month"
echo " Alert   : Email to $YOUR_EMAIL at $ALERT_80%"
echo "========================================"
echo ""
