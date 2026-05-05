# Lab 05 — Azure Monitor Basics

**Time:** ~15 minutes | **Cost:** Free | **Level:** 🟢 Beginner  
**Prerequisite:** Complete [Lab 01](../01-create-resource-group/) first

---

## What is Azure Monitor?

Azure Monitor is **Azure's built-in dashboard for watching everything**.

It collects data about your resources — how much CPU is being used,
how much memory, whether something crashed, how many requests came in —
and shows it all in one place.

**Real-world example:**  
A company's website starts running slowly at 3am.
Nobody notices until customers start complaining.
With Azure Monitor, an alert fires automatically at 3am,
wakes up the on-call engineer, and they fix it before most users are affected.

**Key terms:**
- **Metrics** — numbers over time (CPU %, memory used, requests/second)
- **Logs** — detailed records of what happened and when
- **Alerts** — notifications when something crosses a threshold
- **Workbooks** — custom dashboards for visualizing data

---

## What you'll do in this lab

- [ ] Open Azure Monitor
- [ ] View metrics for a resource
- [ ] Create your first alert rule
- [ ] Explore Log Analytics basics
- [ ] Clean up when done

---

## Step 1 — Open Azure Monitor

1. Go to https://portal.azure.com
2. In the search bar, type **Monitor**
3. Click **Monitor** in the results

You'll land on the Azure Monitor overview page.
Take a moment to look around — this is your observability command center.

---

## Step 2 — Explore the Metrics section

1. Click **Metrics** in the left menu
2. Click **Select a scope**
3. Choose your subscription and select your Resource Group `lab-01-my-first-rg`
4. Select your storage account from Lab 02 (if it still exists)
5. Click **Apply**

Now choose a metric:
| Field | What to select |
|-------|---------------|
| Metric namespace | Blob service |
| Metric | Blob Count |
| Aggregation | Average |

You'll see a graph appear — even if it shows zero, that's the monitoring working correctly.

**What just happened?** You're now watching your storage account
in real time. Any blobs added or removed would show up here.

---

## Step 3 — Create an alert rule

Alerts notify you when something important happens.

1. In Azure Monitor left menu, click **Alerts**
2. Click **+ Create → Alert rule**
3. Click **Select resource** → choose your storage account
4. Click **Done**

Set the condition:
1. Click **Add condition**
2. Search for **Transactions**
3. Set threshold: **Greater than 100**
4. Click **Done**

Set the action (where to send the alert):
1. Click **Add action groups → Create action group**
2. Name it: `lab-alert-group`
3. Under **Notifications**, choose **Email**
4. Enter your email address
5. Click **Review + Create → Create**

Name your alert rule:
| Field | Value |
|-------|-------|
| Alert rule name | `lab-05-storage-alert` |
| Severity | 2 - Warning |

Click **Review + Create → Create**

> ✅ You now have a real alert. If your storage account gets more than
> 100 transactions, Azure will email you automatically.

---

## Step 4 — Explore Log Analytics (optional)

1. In Azure Monitor, click **Logs** in the left menu
2. If prompted, select your workspace or create a new one
3. In the query editor, type:

```
AzureActivity
| take 10
```

4. Click **Run**

This shows the last 10 activity log entries across your Azure account.
This is the same query language (KQL) used by security teams worldwide.

---

## Step 5 — Verify it worked

- ✅ You can see metrics for your storage account
- ✅ Alert rule `lab-05-storage-alert` is created and active
- ✅ You received a confirmation email from Azure Monitor

---

## 🧹 Cleanup

1. Go to Azure Monitor → Alerts → Alert rules
2. Find `lab-05-storage-alert` and delete it
3. Go to Monitor → Alerts → Action groups
4. Delete `lab-alert-group`

---

## 🔍 What you learned

- What Azure Monitor is and why every team uses it
- How to view metrics for any Azure resource
- How to create an alert rule with email notifications
- Your first look at KQL (Kusto Query Language)

---

## ➡️ What's next?

Head to [Lab 06 — RBAC and IAM](../06-rbac-and-iam/)

---

## ❓ Got stuck?

- Check the [main troubleshooting guide](../../README.md#troubleshooting)
- Open an Issue on this repo and describe what happened
