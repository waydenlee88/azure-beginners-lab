# Lab 06 — RBAC and IAM

**Time:** ~15 minutes | **Cost:** Free | **Level:** 🟢 Beginner  
**Prerequisite:** Complete [Lab 01](../01-create-resource-group/) first

---

## What is RBAC?

RBAC stands for **Role-Based Access Control**.

It's how Azure controls **who can do what** with your resources.

Instead of giving everyone full access (dangerous), you give people
only the permissions they need for their job — nothing more.

**Real-world example:**  
A company has:
- Developers who need to deploy apps → **Contributor** role
- Finance team who need to see costs → **Reader** role
- Security team who manage permissions → **Owner** role

Nobody has more access than they need. This is called
the **Principle of Least Privilege** — a core security concept.

**Key roles in Azure:**

| Role | What they can do |
|------|-----------------|
| Owner | Everything — including managing permissions |
| Contributor | Create and manage resources, but NOT manage permissions |
| Reader | View everything, change nothing |
| Custom roles | Exactly what you define — nothing more |

---

## What you'll do in this lab

- [ ] View your current role assignments
- [ ] Understand the IAM panel
- [ ] Assign a Reader role to a user (simulation)
- [ ] View effective permissions
- [ ] Understand scope levels

---

## Step 1 — Open IAM on your Resource Group

1. Go to https://portal.azure.com
2. Go to **Resource Groups → lab-01-my-first-rg**
3. In the left menu, click **Access control (IAM)**

This is where all permissions for this Resource Group are managed.

---

## Step 2 — View current role assignments

1. Click the **Role assignments** tab
2. You'll see your own account listed — probably as **Owner**

Notice the columns:
- **Name** — who has the role
- **Type** — is it a user, group, or service?
- **Role** — what they're allowed to do
- **Scope** — what level this applies to (subscription, RG, or resource)

**What is scope?**  
Scope controls how wide the permission applies:
- **Subscription** — access to everything in your Azure account
- **Resource Group** — access only to resources in this group
- **Resource** — access only to one specific resource

---

## Step 3 — Check your permissions

1. Click **Check access** tab
2. Click **View my access**
3. You'll see all the roles assigned to your account

This is a quick way to answer "why can't I do X?" for any user.

---

## Step 4 — Simulate assigning a role

> We'll walk through the steps without saving, to avoid creating
> unnecessary users. In a real job, you'd complete all steps.

1. Click **+ Add → Add role assignment**
2. On the **Role** tab, search for **Reader**
3. Select **Reader** and click **Next**
4. On the **Members** tab, click **+ Select members**
5. Search for your own email address
6. Click **Select**

You can see how this would look — you're assigning the Reader role
to a specific person, scoped to this Resource Group only.

7. Click **Cancel** — we don't need to save this

---

## Step 5 — Explore built-in roles

1. Go back to **Access control (IAM)**
2. Click **+ Add → Add role assignment**
3. Click **View** next to any role to see its full permissions

Notice that the **Reader** role has hundreds of specific permissions
all set to read-only. This is the detail behind every role in Azure.

4. Click **Cancel**

---

## Step 6 — Verify what you learned

- ✅ You can find and open the IAM panel on any resource
- ✅ You understand Owner vs Contributor vs Reader
- ✅ You understand what scope means
- ✅ You know how to check any user's access

---

## 🧹 Cleanup

No resources were created in this lab — nothing to clean up! ✅

---

## 🔍 What you learned

- What RBAC is and why it's critical for security
- The three main Azure roles: Owner, Contributor, Reader
- What scope means and how it controls permission breadth
- How to check any user's effective permissions
- The Principle of Least Privilege

---

## ➡️ What's next?

Head to [Lab 07 — Cost Management](../07-cost-management/)

---

## ❓ Got stuck?

- Check the [main troubleshooting guide](../../README.md#troubleshooting)
- Open an Issue on this repo and describe what happened
