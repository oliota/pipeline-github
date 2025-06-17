# 🛠️ Auto Commit Timeline

**Auto Commit Timeline** is an experimental project designed to explore the capabilities of **GitHub Actions** in a continuous integration and delivery (CI/CD) workflow.

This project demonstrates how automation can be used to:
- Trigger scheduled workflows using GitHub Actions
- Generate multiple commits dynamically based on the system clock
- Maintain a highly active contribution graph
- Perform daily cleanup and reset operations

## 🚀 Purpose

The main goal is to simulate a complete CI/CD pipeline that runs continuously without manual intervention. It highlights how GitHub's infrastructure can be leveraged not only for production-ready pipelines, but also for creative and automated interactions with repositories.

## ⚙️ How It Works

- **Every 30 minutes**, the workflow generates and pushes 40 new commits with timestamped files.
- **At 23:59**, it performs a full cleanup by removing all generated files and pushing the deletion.
- Commit data is generated via bash scripts, and all logic runs inside the GitHub-hosted environment.

## 📦 What's Inside

- `.github/workflows/auto-commit.yml`: Orchestrates the automated workflow
- `generate_commits.sh`: Script that generates and commits 40 files per run
- `daily_cleanup.sh`: Script that clears commit files at the end of the day
- `commits/`: Directory where daily files are stored

## ✨ Why?

This project is a personal exploration of:
- GitHub Actions flexibility
- CI/CD scheduling
- Git-based automation techniques
- Visual feedback through the GitHub contribution graph

## 🧠 Author

Made with curiosity and a touch of automation by [Rubem Oliota](https://github.com/oliota)
