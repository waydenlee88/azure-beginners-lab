# Lab 08 — Azure CLI Basics

**Time:** ~20 minutes | **Cost:** Free | **Level:** 🟢 Beginner  
**Prerequisite:** Complete all previous labs first

---

## What is the Azure CLI?

The Azure CLI is a **command-line tool that lets you control Azure by typing commands**.

Instead of clicking through the Portal, you type a command and Azure does it instantly.

**Why does this matter?**
- Faster than clicking through menus
- You can automate repetitive tasks with scripts
- It's how professionals manage Azure at scale
- The same commands work on Windows, Mac, and Linux

**Real-world example:**  
An engineer needs to create 50 storage accounts for 50 customers.
Doing it manually in the Portal would take 3 hours.
With a CLI script, it takes 2 minutes.

---

## What you'll do in this lab

- [ ] Install the Azure CLI (or use Azure Cloud Shell — no install needed)
- [ ] Log in to Azure from the command line
- [ ] Run your first Azure CLI commands
- [ ] Recreate what you built in Labs 01–02 using just commands
- [ ] Explore useful CLI commands to remember

---

## Option A — Use Azure Cloud Shell (recommended for beginners)

No installation required. It runs in your browser.

1. Go to https://portal.azure.com
2. Click the **Cloud Shell icon** at the top (looks like `>_`)
3. Select **Bash**
4. If prompted, create a storage account for Cloud Shell (click Create)

You now have a terminal running inside Azure. ✅

---

## Option B — Install Azure CLI on your computer

If you prefer to use your own machine:

**Windows:**
1. Download from https://aka.ms/installazurecliwindows
2. Run the installer
3. Open Command Prompt or PowerShell

**Mac:**
```bash
brew update && brew install azure-cli
```

**Linux (Ubuntu/Debian):**
```bash
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
```

---

## Step 1 — Log in to Azure

```bash
az login
```

A browser window will open. Sign in with your Microsoft account.
When done, your terminal will show your subscription details.

**What just happened?** The CLI is now connected to your Azure account.
Every command you run will affect your real Azure resources.

---

## Step 2 — Check your account

```bash
# See which account you're logged into
az account show

# See all your subscriptions
az account list --output table
```

The `--output table` flag makes the output easier to read.
You can also use `--output json` or `--output yaml`.

---

## Step 3 — Work with Resource Groups

```bash
# List all your Resource Groups
az group list --output table

# Create a new Resource Group
az group create \
  --name lab-08-cli-rg \
  --location eastus \
  --tags environment=lab lab=08

# Show details of a Resource Group
az group show --name lab-08-cli-rg
```

**What just happened?** You created a Resource Group with one command —
the same thing that took 5 portal clicks in Lab 01.

---

## Step 4 — Work with Storage Accounts

```bash
# Create a storage account
az storage account create \
  --name labclistorage$RANDOM \
  --resource-group lab-08-cli-rg \
  --location eastus \
  --sku Standard_LRS \
  --kind StorageV2

# List storage accounts in your Resource Group
az storage account list \
  --resource-group lab-08-cli-rg \
  --output table
```

> `$RANDOM` adds a random number to make the name unique.

---

## Step 5 — Useful commands to remember

```bash
# Get help on any command
az [command] --help

# Example: help for storage account
az storage account --help
az storage account create --help

# Find commands by keyword
az find "resource group"

# Check Azure CLI version
az version

# Log out
az logout
```

---

## Step 6 — The CLI command pattern

Every Azure CLI command follows this pattern:

```
az  [service]  [action]  --[options]
 ↑      ↑         ↑           ↑
 az  storage  account create  --name mystorage
```

Once you learn this pattern, you can figure out almost any command.

---

## Step 7 — Quick reference — commands from all 8 labs

```bash
# Resource Groups (Lab 01)
az group create --name [name] --location eastus
az group list --output table
az group delete --name [name] --yes

# Storage (Lab 02)
az storage account create --name [name] --resource-group [rg] --location eastus --sku Standard_LRS
az storage account list --resource-group [rg] --output table

# Virtual Machines (Lab 03)
az vm create --name [name] --resource-group [rg] --image UbuntuLTS --size Standard_B1s
az vm stop --name [name] --resource-group [rg]
az vm delete --name [name] --resource-group [rg] --yes

# Networking (Lab 04)
az network vnet create --name [name] --resource-group [rg] --address-prefix 10.0.0.0/16
az network vnet subnet create --name [name] --vnet-name [vnet] --resource-group [rg] --address-prefix 10.0.1.0/24

# Cost (Lab 07)
az consumption budget list
```

---

## Step 8 — Verify it worked

- ✅ You can run `az account show` and see your account
- ✅ Resource Group `lab-08-cli-rg` was created with a command
- ✅ You understand the `az [service] [action] --[options]` pattern

---

## 🧹 Cleanup

```bash
# Delete everything from this lab
az group delete --name lab-08-cli-rg --yes --no-wait

# The --no-wait flag means you don't have to wait for it to finish
# Azure deletes it in the background
```

---

## 🎉 You finished all 8 labs!

Here's what you've built and learned:

| Lab | Topic | Key skill |
|-----|-------|-----------|
| 01 | Resource Groups | Azure organization |
| 02 | Storage Accounts | Cloud storage |
| 03 | Virtual Machines | Cloud compute |
| 04 | VNets & Subnets | Cloud networking |
| 05 | Azure Monitor | Observability |
| 06 | RBAC & IAM | Security & identity |
| 07 | Cost Management | FinOps |
| 08 | Azure CLI | Automation |

**You now have the foundation every Azure professional builds on.**

---

## ➡️ What to explore next

- **AKS (Kubernetes)** → [aks-hello-world-complete](https://github.com/waydenlee88/aks-hello-world-complete)
- **CI/CD Pipelines** → [github-actions-azure-deploy](https://github.com/waydenlee88/github-actions-azure-deploy)
- **Azure AI** → [azure-openai-support-bot](https://github.com/waydenlee88/azure-openai-support-bot)

---

## ⭐ You made it!

**Star this repo** if these labs helped you learn Azure.  
**Follow [cloudwithwayden](https://github.com/waydenlee88)** for more beginner-friendly cloud content.  
**Share your progress** on LinkedIn — tag me and let me know you finished! 🎉

---

## ❓ Got stuck?

- Check the [main troubleshooting guide](../../README.md#troubleshooting)
- Open an Issue on this repo and describe what happened
