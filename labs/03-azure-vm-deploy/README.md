# Lab 03 — Deploy a Virtual Machine

**Time:** ~20 minutes | **Cost:** ~$0.05 | **Level:** 🟢 Beginner  
**Prerequisite:** Complete [Lab 01](../01-create-resource-group/) first

---

## What is a Virtual Machine?

A Virtual Machine (VM) is a **computer that runs in the cloud**.

Instead of buying a physical server, you rent one from Microsoft.
You pay only for the time it runs — and you can turn it off anytime.

**Real-world example:**  
A startup needs a web server but can't afford physical hardware.
They create an Azure VM, deploy their website on it, and pay $20/month
instead of buying a $3,000 server.

**Key terms:**
- **VM Size** — how powerful the computer is (CPU + RAM)
- **OS Disk** — the hard drive the VM boots from
- **Public IP** — the address you use to connect to the VM
- **NSG (Network Security Group)** — the firewall rules for the VM

---

## What you'll do in this lab

- [ ] Create a Virtual Machine in Azure
- [ ] Connect to it using your browser
- [ ] Verify it's running
- [ ] Stop and delete it to avoid charges

---

## If you're new, read this first

> VMs can sound scary. They're not.
> Think of it as renting a laptop that lives in Microsoft's building.
> You turn it on, use it, turn it off, and only pay for what you use.

---

## Step 1 — Go to your Resource Group

1. Go to https://portal.azure.com
2. Search for **Resource Groups**
3. Click `lab-01-my-first-rg`

---

## Step 2 — Create a Virtual Machine

1. Click **+ Create** inside your Resource Group
2. Search for **Virtual Machine** and select it
3. Click **Create → Azure Virtual Machine**

Fill in the **Basics** tab:

| Field | What to enter |
|-------|---------------|
| Resource Group | `lab-01-my-first-rg` |
| Virtual machine name | `lab-03-my-first-vm` |
| Region | East US (same as before) |
| Image | Ubuntu Server 22.04 LTS |
| Size | Click "See all sizes" → search B1s → select it |
| Authentication type | Password |
| Username | `azureuser` |
| Password | Create a strong password and write it down |

> ⚠️ The B1s size is the cheapest option (~$0.05/hour).
> Always choose the smallest size for labs.

---

## Step 3 — Configure disks

Click **Next: Disks**

| Field | What to enter |
|-------|---------------|
| OS disk type | Standard HDD (cheapest) |

Leave everything else as default.

---

## Step 4 — Configure networking

Click **Next: Networking**

| Field | What to enter |
|-------|---------------|
| Virtual network | Create new → name it `lab-vnet` |
| Subnet | Default |
| Public IP | Create new (leave default name) |
| NIC security group | Basic |
| Public inbound ports | Allow selected ports |
| Select inbound ports | SSH (22) |

---

## Step 5 — Review and Create

1. Click **Review + Create**
2. Wait for validation to pass (green checkmark)
3. Click **Create**

Deployment takes 2–3 minutes. You'll see a progress screen.

**What just happened?** Azure is spinning up a real Linux computer
in their data center. When it's done, you'll have full access to it.

---

## Step 6 — Connect to your VM

1. Click **Go to resource** when deployment is complete
2. Click **Connect** at the top
3. Select **Connect** under Native SSH
4. Follow the instructions shown — or use the **Serial Console** option
   in the left menu under Help for a browser-based connection

---

## Step 7 — Verify it's running

On your VM's overview page you should see:
- ✅ Status: **Running**
- ✅ Public IP address assigned
- ✅ Operating system: Ubuntu

---

## 🧹 Cleanup — IMPORTANT

VMs cost money while running. Do this now:

1. On your VM page, click **Stop** to stop the VM
2. Then click **Delete** to remove it completely
3. Confirm deletion

> Stopping a VM reduces cost but doesn't eliminate it (disk still costs money).
> Always Delete when you're done with a lab VM.

---

## 🔍 What you learned

- What a Virtual Machine is and when to use one
- How to create a VM in the Azure Portal
- Key VM settings: size, OS, networking, authentication
- How to stop and delete a VM to avoid charges

---

## ➡️ What's next?

Head to [Lab 04 — VNets and Subnets](../04-vnet-and-subnets/)

---

## ❓ Got stuck?

- Check the [main troubleshooting guide](../../README.md#troubleshooting)
- Open an Issue on this repo and describe what happened
