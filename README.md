# Automated Hourly Commit Workflow

## Overview

This project automates hourly commits to a `contribuition.txt` file. It's ideal for keeping your GitHub contribution graph active and ensuring regular activity in your repositories.

## Features

* Adds a timestamped line every hour
* Pushes changes to the remote repository automatically
* Provides a local test script (`local_test.sh`) for manual execution

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

```bash
npm run local-test
```

#### GitHub Action

The `.github/workflows/daily-actions.yml` workflow triggers every hour and:

* Updates the `contribuition.txt` file
* Commits and pushes the change

## Directory Structure

```
root
├─ .github/workflows/daily-actions.yml
├─ local_test.sh
├─ contribuition.txt
├─ package.json
├─ README.md
```

## Contributing

If you want to add features or fix issues, feel free to open a Pull Request.

## License

This project is licensed under the ISC License.
