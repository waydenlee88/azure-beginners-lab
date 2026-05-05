# Lab 02 — Storage Account Basics

**Time:** ~15 minutes | **Cost:** ~$0.01 | **Level:** 🟢 Beginner  
**Prerequisite:** Complete [Lab 01](../01-create-resource-group/) first

---

## What is a Storage Account?

A Storage Account is **Azure's version of a hard drive in the cloud**.

Instead of saving files on your laptop, you save them in Azure.
Anyone with the right permissions can access them from anywhere in the world.

**Three things you can store:**
- **Blobs** — any file (images, videos, documents, backups)
- **Files** — shared folders that work like a network drive
- **Queues** — messages between applications (advanced topic for later)

**Real-world example:**  
A small business uses Azure Blob Storage to store customer invoices as PDFs.
Their accounting team can access them from any device without emailing files around.

---

## What you'll do in this lab

- [ ] Create a Storage Account in Azure
- [ ] Create a container (like a folder inside the storage)
- [ ] Upload a file to the cloud
- [ ] Access your file via a URL
- [ ] Clean up to avoid charges

---

## Step 1 — Open your Resource Group from Lab 01

1. Go to https://portal.azure.com
2. Search for **Resource Groups**
3. Click `lab-01-my-first-rg`

> We're adding storage inside the Resource Group we created in Lab 01.
> This is how Azure works — resources live inside Resource Groups.

---

## Step 2 — Create a Storage Account

1. Click **+ Create** inside your Resource Group
2. Search for **Storage Account** and select it
3. Click **Create**

Fill in the form:

| Field | What to enter |
|-------|---------------|
| Subscription | Your subscription |
| Resource Group | `lab-01-my-first-rg` |
| Storage account name | `labstorage` + your initials (e.g. `labstoragewl`) |
| Region | Same as Lab 01 (East US) |
| Performance | Standard |
| Redundancy | Locally-redundant storage (LRS) — cheapest option |

> ⚠️ Storage account names must be globally unique and lowercase only.
> If your name is taken, add a number: `labstoragewl2`

4. Click **Review** then **Create**

**What just happened?** Azure is creating a storage account.
It takes about 30 seconds.

---

## Step 3 — Create a container

A container is like a folder inside your storage account.

1. Click **Go to resource** once it's created
2. In the left menu, find **Data storage → Containers**
3. Click **+ Container**
4. Name it: `my-first-container`
5. Public access level: **Private** (leave as default)
6. Click **Create**

---

## Step 4 — Upload a file

1. Click your container `my-first-container`
2. Click **Upload**
3. Choose any file from your computer (a small image or text file works great)
4. Click **Upload**

**What just happened?** Your file is now stored in Azure.
It lives in Microsoft's data center, not on your computer.

---

## Step 5 — View your file

1. Click on the file you just uploaded
2. You'll see its properties including a **URL**
3. Notice the URL format:
```
https://[your-storage-account].blob.core.windows.net/my-first-container/[filename]
```
This is how applications access files stored in Azure.

---

## Step 6 — Verify it worked

- ✅ Storage account created and shows "Available"
- ✅ Container `my-first-container` exists
- ✅ Your file appears in the container with a URL

---

## 🧹 Cleanup

This lab costs about $0.01/month to keep running. To clean up:

**Option A — Delete just the storage account:**
1. Go back to the storage account
2. Click **Delete** at the top
3. Confirm by typing the storage account name

**Option B — Delete the whole Resource Group:**
1. Go to Resource Groups
2. Click `lab-01-my-first-rg`
3. Click **Delete resource group**

> Use Option B if you're done with all labs. Use Option A to keep going.

---

## 🔍 What you learned

- What Azure Storage is and why it exists
- The difference between a Storage Account and a Container
- How to upload files to the cloud
- How Azure generates a URL for every file

---

## ➡️ What's next?

Head to [Lab 03 — Deploy a Virtual Machine](../03-azure-vm-deploy/)

---

## ❓ Got stuck?

- Check the [main troubleshooting guide](../../README.md#troubleshooting)
- Open an Issue on this repo and describe what happened
