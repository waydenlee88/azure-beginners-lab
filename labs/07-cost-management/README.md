# Lab 07 — Cost Management

**Time:** ~10 minutes | **Cost:** Free | **Level:** 🟢 Beginner  
**Prerequisite:** Complete [Lab 01](../01-create-resource-group/) first

---

## Why does cost management matter?

Azure charges for almost everything — compute, storage, networking,
and sometimes even just having a resource sitting idle.

Without cost management, it's easy to accidentally leave a VM running
for a month and get a $200 bill you weren't expecting.

**Real-world example:**  
A developer at a startup forgot to delete a VM they used for testing.
It ran for 3 months unnoticed. The bill: $847.
With a budget alert set at $50, they would have caught it on day 3.

**This lab shows you how to never be that developer.**

---

## What you'll do in this lab

- [ ] Open Azure Cost Management
- [ ] View your current spending
- [ ] Create a budget with an alert
- [ ] Set up a cost alert at 80% threshold
- [ ] Learn the top ways to reduce Azure costs

---

## Step 1 — Open Cost Management

1. Go to https://portal.azure.com
2. Search for **Cost Management** in the top search bar
3. Click **Cost Management**

You'll land on the Cost Management overview. If you're using a free account,
your costs will be $0 or very low — that's expected.

---

## Step 2 — Explore Cost Analysis

1. Click **Cost analysis** in the left menu
2. Look at the chart showing your spending over time

Try changing the views:
- **Accumulated cost** — total spend building up over the month
- **Daily costs** — what you spent each day
- **By resource** — which resources cost the most

This is your financial dashboard for Azure.

---

## Step 3 — Create a Budget

A budget is an automatic alert that emails you when spending gets too high.

1. Click **Budgets** in the left menu
2. Click **+ Add**

Fill in the form:

| Field | What to enter |
|-------|---------------|
| Name | `lab-monthly-budget` |
| Reset period | Monthly |
| Start date | First day of current month |
| Budget amount | $10 (safe limit for learning) |

Click **Next: Alerts**

---

## Step 4 — Set up alert thresholds

Add two alerts:

**Alert 1 — Warning at 80%:**
| Field | Value |
|-------|-------|
| Type | Actual |
| % of budget | 80 |
| Action group | Create new → name it `budget-alerts` |
| Email | Your email address |

**Alert 2 — Critical at 100%:**
| Field | Value |
|-------|-------|
| Type | Actual |
| % of budget | 100 |
| Email | Your email address |

Click **Create**

> ✅ Now if your Azure spending reaches $8 (80% of $10),
> you'll get an email warning. At $10, you'll get another.
> You'll never be surprised by a bill again.

---

## Step 5 — Learn the top cost-saving habits

These habits will save you money every month:

| Habit | Why it matters |
|-------|---------------|
| Delete resources when done | Idle resources still cost money |
| Use B-series VMs for labs | Cheapest VM size for low-traffic workloads |
| Set budgets before you start | Catch overruns early |
| Use free tier resources | Storage, VNets, and IAM are free |
| Check cost analysis weekly | Spot surprises before they compound |
| Use auto-shutdown on VMs | Turns off VMs at a set time automatically |

---

## Step 6 — Enable VM Auto-Shutdown (bonus)

If you have a VM running from Lab 03:

1. Go to your VM → left menu → **Operations → Auto-shutdown**
2. Toggle it **On**
3. Set time: **7:00 PM** (or whenever you stop working)
4. Enable notifications → enter your email
5. Click **Save**

> This single setting has saved developers thousands of dollars.

---

## Step 7 — Verify it worked

- ✅ Budget `lab-monthly-budget` created at $10/month
- ✅ Alert set at 80% ($8) and 100% ($10)
- ✅ You received a confirmation email from Azure Cost Management

---

## 🧹 Cleanup

The budget itself is free. You can keep it active — it's protecting you.

To delete it later:
1. Cost Management → Budgets
2. Click your budget → Delete

---

## 🔍 What you learned

- How to read Azure Cost Analysis
- How to create a budget with threshold alerts
- The top habits that prevent surprise Azure bills
- How VM auto-shutdown saves money automatically

---

## ➡️ What's next?

Head to [Lab 08 — Azure CLI Basics](../08-azure-cli-basics/) — the final lab!

---

## ❓ Got stuck?

- Check the [main troubleshooting guide](../../README.md#troubleshooting)
- Open an Issue on this repo and describe what happened
