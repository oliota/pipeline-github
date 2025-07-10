# Automated Hourly Commit Workflow

## Overview  
Automates hourly activity by adding a timestamped line to `contribuition.txt`. Keeps your GitHub contribution graph active and natural throughout the year.

## Features  
- Adds a timestamp every hour  
- Pushes changes automatically via GitHub Actions  
- Randomly decides (~50%) when to commit and push, making activity unpredictable  
- Uses `GITHUB_ACTOR` automatically for commit user/email in Actions  

## How to Setup  

1. **Create a new repository**  
   - On GitHub, click **New → Repository** and name it `pipeline-github`.  

2. **Clone it locally**  
   ```bash
   git clone https://github.com/<your-username>/pipeline-github.git
   cd pipeline-github
   ```

3. **Download & extract ZIP**  
   - Download the ZIP of this project and extract its contents.  

4. **Copy files into your clone**  
   - Copy **all files and folders** from the extracted ZIP into your `pipeline-github` folder, overwriting if prompted.

5. **Push initial commit**  
   ```bash
   git add .
   git commit -m "Initialize project"
   git push
   ```

### Alternatives without installing anything

- **Web UI upload**  
  1. In your new repo on GitHub, click **Add file → Upload files**  
  2. Drag & drop all files from the extracted ZIP  
  3. Commit changes

- **Drag & drop locally**  
  1. Open your cloned `pipeline-github` folder in your file explorer  
  2. Drag the extracted files into that folder  
  3. In the terminal, run the push commands from step 5

## Directory Structure  
```
root
├─ .github/workflows/daily-actions.yml
├─ contribuition.txt
├─ package.json
├─ README.md
```


![Snake animation](https://github.com/oliota/pipeline-github/blob/output/github-contribution-grid-snake.svg)