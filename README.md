# 🕒 Auto Commit Timeline (GitHub Actions)

This project is a fully automated GitHub Actions workflow that:

- Creates a branch with the current date
- Commits a timestamped file
- Opens and closes an issue
- Creates, approves, and merges a pull request

The goal is to generate one real GitHub contribution per day using automation.

---

## 🚀 How It Works

- The workflow is scheduled with `cron: */5 * * * *` (every 5 minutes)
- A Node.js script checks if the current UTC time matches the defined target (`EXEC_HOUR` and `EXEC_MIN`)
- If matched, it executes the full contribution flow
- Execution tolerance: **±1 minute**

---

## 🔐 Required Setup

To allow GitHub Actions to push code, create issues, and merge pull requests, a **Personal Access Token** is required.

### 1. **Create a Personal Access Token**

1. Go to: [https://github.com/settings/tokens](https://github.com/settings/tokens)
2. Click **"Generate new token (classic)"**
3. Give it a name like `auto-contributor`
4. Enable the following scopes:
   - `repo`
   - `workflow`
5. Generate and copy the token (**you won't see it again**)

### 2. **Create a Secret (`GH_PAT`)**

In your repository:

- Go to `Settings` → `Secrets and variables` → `Actions`
- Click `New repository secret`
- Name: `GH_PAT`
- Value: *paste your generated token*
- Save

---

## ⚙️ Create an Environment and Variables

To make the execution hour configurable, use environment-level variables.

### 1. **Create an Environment**

1. Go to: `Settings` → `Environments`
2. Click `New environment`
3. Name it: `production`
4. Click `Configure environment`

### 2. **Add Variables to the Environment**

Inside the `production` environment:

- `EXEC_HOUR` → Set to your desired **UTC hour** (e.g., `18`)
- `EXEC_MIN` → Set to your desired **UTC minute** (e.g., `50`)

> These control the exact time the script will run each day.

---

## 🔁 Running Daily

The workflow will be evaluated every 5 minutes. The script will only proceed if the time matches `EXEC_HOUR` and `EXEC_MIN` (±1 minute).

You can also trigger it manually from the **Actions** tab by clicking **"Run workflow"**.

---

## 📂 Project Structure

