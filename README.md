# Automated Hourly Commit Workflow

## Overview

This project automates hourly commits to a `contribuition.txt` file. It's ideal for keeping your GitHub contribution graph active and ensuring regular activity in your repositories.

## Features

* Adds a timestamped line every hour
* Pushes changes automatically to the remote repository via GitHub Actions
* Provides separate test scripts for both Linux (`local_test.sh`) and Windows (`local_test.bat`)

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

### Scripts

#### Local Test

Run the script to test hourly contribution behavior:

**For Linux:**

```bash
npm run local-test:sh
```

**For Windows:**

```bash
npm run local-test:win
```

#### GitHub Action

The `.github/workflows/daily-actions.yml` workflow triggers every hour and:

* Updates the `contribuition.txt` file
* Commits and pushes the change automatically

## Directory Structure

``` root
├─ .github/workflows/daily-actions.yml
├─ local_test.sh
├─ local_test.bat
├─ contribuition.txt
├─ package.json
├─ README.md
```
