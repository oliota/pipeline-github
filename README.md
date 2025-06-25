# Automated Hourly Commit Workflow

## Overview

Automates hourly activity by adding a timestamped line to `contribuition.txt`. Helps keep your GitHub contribution graph active and natural throughout the year.

## Features

* Adds a timestamp every hour
* Pushes changes automatically via GitHub Actions
* Randomly decides (\~50%) when to commit and push, making activity unpredictable
* Uses the `GITHUB_ACTOR` automatically for commit user/email

## Getting Started

### Prerequisites

* Node.js and npm installed
* Git configured with your username and email

### Install

Clone the repository:

```bash
git clone https://github.com/oliota/pipeline-github.git
cd pipeline-github
npm install
```

### GitHub Action

The `.github/workflows/daily-actions.yml` workflow:

* Triggers every hour
* Randomly decides (\~50%) if it will commit and push
* Updates `contribuition.txt` when selected
* Pushes changes automatically using `GITHUB_ACTOR`

#### ⚡️ Important for Forks

By default, GitHub does NOT run Actions automatically after a fork. To enable them:

* Make a small change (e.g., add a line to `README.md`) and commit/push it.
* This will trigger the workflow and enable it for future automated runs.

## Directory Structure

```
root
├─ .github/workflows/daily-actions.yml
├─ contribuition.txt
├─ package.json
├─ README.md
```

