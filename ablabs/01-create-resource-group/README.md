# Lab 01 — Create a Resource Group

**Time:** ~10 minutes | **Cost:** Free | **Level:** 🟢 Beginner

---

## What is a Resource Group?

Think of a Resource Group like a **folder on your computer**.

When you create anything in Azure — a server, a database, a storage account —
it has to live somewhere. That somewhere is a Resource Group.

- One Resource Group can hold many resources
- You can delete a Resource Group and everything inside it disappears
- This is how you avoid surprise charges (delete the folder, delete the bill)

**Real-world example:**  
A company might have one Resource Group called `production-app` for their
live website, and another called `dev-testing` for experiments.
If the experiment goes wrong, they delete `dev-testing` and nothing else is affected.

---

## What you'll do in this lab

- [ ] Sign in to the Azure Portal
- [ ] Create your first Resource Group
- [ ] Explore what's inside it
- [ ] Tag it properly (best practice)
- [ ] Clean up when done

---

## If you're new, read this first

> You don't need to understand everything right now.
> Just follow each step and it will make sense as you go.

---

## Step 1 — Sign in to the Azure Portal

1. Open your browser and go to https://portal.azure.com
2. Sign in with your Microsoft account
3. You should see the Azure Portal home screen

**What just happened?** You're now inside Azure's control panel.
Everything you do in Azure can be done from this screen.

---

## Step 2 — Find Resource Groups

1. In the search bar at the top, type **Resource Groups**
2. Click **Resource Groups** in the results
3. You'll see a list (probably empty right now — that's normal)

---

## Step 3 — Create your first Resource Group

1. Click **+ Create** in the top-left
2. Fill in the form:

| Field | What to enter |
|-------|---------------|
| Subscription | Your subscription (select from dropdown) |
| Resource group name | `lab-01-my-first-rg` |
| Region | East US (or the region closest to you) |

3. Click **Next: Tags**

---

## Step 4 — Add a tag (best practice)

Tags are like labels on a folder. They help you find and manage resources.

On the Tags screen, add:

| Name | Value |
|------|-------|
| `environment` | `lab` |
| `owner` | `your-name` |

4. Click **Review + Create**
5. Click **Create**

**What just happened?** Azure validated your settings and is now
creating your Resource Group. It takes about 5 seconds.

---

## Step 5 — Explore your Resource Group

1. Click **Go to resource group** (or search for it in Resource Groups)
2. Look at the screen — notice:
   - **Essentials** panel: shows location, subscription, tags
   - **Resources** tab: empty for now — we'll add things in later labs
   - **Access control (IAM)**: who has permission to use this
   - **Cost analysis**: spending tracker

Take 2 minutes to click around. You won't break anything.

---

## Step 6 — Verify it worked

You should see:
- ✅ A resource group named `lab-01-my-first-rg`
- ✅ Region shows East US (or your chosen region)
- ✅ Tags show `environment: lab`

---

## 🧹 Cleanup — do this when you're done

Resource Groups themselves are free, but anything inside them costs money.

To delete this Resource Group:
1. Go to **Resource Groups**
2. Click `lab-01-my-first-rg`
3. Click **Delete resource group**
4. Type the resource group name to confirm
5. Click **Delete**

> ✅ You won't be charged anything for this lab.
> But always clean up — it's a great habit to build.

---

## 🔍 What you learned

- What a Resource Group is and why it exists
- How to create one in the Azure Portal
- How to tag resources (best practice)
- How to clean up to avoid charges

---

## ➡️ What's next?

Head to [Lab 02 — Storage Account Basics](../02-storage-account-basics/) to create your first piece of Azure storage inside this Resource Group.

---

## ❓ Got stuck?

- Re-read the step where you got lost
- Check the [main troubleshooting guide](../../README.md#troubleshooting)
- Open an Issue on this repo and describe what happened
