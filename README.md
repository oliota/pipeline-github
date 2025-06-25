# Automated Hourly Commit Workflow

## Overview

Automates hourly activity by adding a timestamped line to `contribuition.txt`. Helps keep your GitHub contribution graph active and natural throughout the year.

## Features

* Adds a timestamp every hour
* Pushes changes automatically via GitHub Actions
* Randomly decides (\~50%) when to commit and push, making activity unpredictable
* Provides test scripts for both Linux (`local_test.sh`) and Windows (`local_test.bat`)

## Getting Started

1. Install Node.js, npm, and configure Git.
2. Clone the repository:

```bash
git clone https://github.com/oliota/pipeline-github.git
cd pipeline-github
npm install
```

3. Run the Scripts:

   * Linux:

   ```bash
   npm run local-test:sh
   ```

   * Windows:

   ```bash
   npm run local-test:win
   ```

## GitHub Action

The `.github/workflows/daily-actions.yml` workflow:

* Triggers every hour
* Randomly decides (\~50%) if it will commit and push
* Updates `contribuition.txt` when selected
* Pushes changes automatically

## Directory Structure

```
root
├─ .github/workflows/daily-actions.yml
├─ local_test.sh
├─ local_test.bat
├─ contribuition.txt
├─ package.json
├─ README.md
```
