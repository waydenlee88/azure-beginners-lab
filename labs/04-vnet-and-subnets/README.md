# Lab 04 — Virtual Networks and Subnets

**Time:** ~20 minutes | **Cost:** Free | **Level:** 🟢 Beginner  
**Prerequisite:** Complete [Lab 01](../01-create-resource-group/) first

---

## What is a Virtual Network?

A Virtual Network (VNet) is a **private network inside Azure**.

Think of it like the network in your home or office — but in the cloud.
Your Azure resources (VMs, databases, apps) talk to each other through the VNet.
Nothing gets in or out unless you allow it.

**What is a Subnet?**  
A Subnet is a **section of your VNet**. You divide your VNet into subnets
to organize and isolate different types of resources.

**Real-world example:**  
A company has one VNet for their whole application.
Inside it, they have:
- A **public subnet** for their web servers (internet can reach these)
- A **private subnet** for their database (only the web servers can reach this)

This way, hackers on the internet can never directly access the database.

---

## What you'll do in this lab

- [ ] Create a Virtual Network
- [ ] Add two subnets (public and private)
- [ ] Explore the network topology view
- [ ] Understand IP address ranges
- [ ] Clean up when done

---

## Understanding IP ranges (super simple version)

Every device on a network needs an address — just like a house needs a street address.

In Azure, you'll see ranges like `10.0.0.0/16`. Here's what that means:

| Range | Plain English |
|-------|--------------|
| `10.0.0.0/16` | 65,536 addresses — your whole VNet |
| `10.0.1.0/24` | 256 addresses — one subnet |
| `10.0.2.0/24` | 256 addresses — another subnet |

> You don't need to memorize this. Just use the defaults for now.

---

## Step 1 — Go to your Resource Group

1. Go to https://portal.azure.com
2. Search for **Resource Groups**
3. Click `lab-01-my-first-rg`

---

## Step 2 — Create a Virtual Network

1. Click **+ Create**
2. Search for **Virtual Network** and select it
3. Click **Create**

Fill in the **Basics** tab:

| Field | What to enter |
|-------|---------------|
| Resource Group | `lab-01-my-first-rg` |
| Name | `lab-04-vnet` |
| Region | East US |

---

## Step 3 — Configure IP addresses

Click **Next: IP Addresses**

You'll see a default address space of `10.0.0.0/16` — leave it.

**Delete the default subnet** and create two new ones:

**Subnet 1 — Public:**
| Field | Value |
|-------|-------|
| Name | `subnet-public` |
| Starting address | `10.0.1.0` |
| Size | `/24` (256 addresses) |

**Subnet 2 — Private:**
| Field | Value |
|-------|-------|
| Name | `subnet-private` |
| Starting address | `10.0.2.0` |
| Size | `/24` (256 addresses) |

---

## Step 4 — Review and Create

1. Click **Review + Create**
2. Click **Create**

Deployment takes about 30 seconds.

**What just happened?** You've created a private cloud network
with two sections — one for public-facing resources and one
for private backend resources. This is a real enterprise pattern.

---

## Step 5 — Explore the topology view

1. Click **Go to resource**
2. In the left menu, find **Monitoring → Diagram**
3. You'll see a visual map of your VNet and subnets

This is the network topology view — a great way to visualize
how resources connect in Azure.

---

## Step 6 — Verify it worked

- ✅ VNet `lab-04-vnet` created with address space `10.0.0.0/16`
- ✅ Subnet `subnet-public` at `10.0.1.0/24`
- ✅ Subnet `subnet-private` at `10.0.2.0/24`

---

## 🧹 Cleanup

VNets are free, but clean up anyway to stay organized:

1. Go to Resource Groups
2. Click `lab-01-my-first-rg`
3. Find `lab-04-vnet` and delete it
   (or delete the whole Resource Group if done with all labs)

---

## 🔍 What you learned

- What a Virtual Network is and why it exists
- What subnets are and how to use them for isolation
- How IP address ranges work (the basics)
- The public vs private subnet architecture pattern

---

## ➡️ What's next?

Head to [Lab 05 — Azure Monitor Basics](../05-azure-monitor-basics/)

---

## ❓ Got stuck?

- Check the [main troubleshooting guide](../../README.md#troubleshooting)
- Open an Issue on this repo and describe what happened
