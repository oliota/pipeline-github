#!/bin/bash
set -e

DATE=$(date +'%Y-%m-%d')
USERNAME="${GITHUB_ACTOR}"
REPO_URL="https://x-access-token:${GH_ALL_TOKEN}@github.com/${USERNAME}/${USERNAME}.git"
TARGET_DIR="img/svg/resume"
SVG_FILE="resume_profile.svg"
LOCAL_PATH="${TARGET_DIR}/${SVG_FILE}"
SVG_URL="https://heroku-backend-nodejs-fd16668acdd6.herokuapp.com/api/v1/summary-svg?user=${USERNAME}"

git clone "$REPO_URL" profile-repo
cd profile-repo

mkdir -p "$TARGET_DIR"
curl -fsSL "$SVG_URL" -o "$LOCAL_PATH"

if ! grep -q "<!-- summary:start -->" README.md; then
  echo -e "\n<!-- summary:start -->\n<!-- summary:end -->" >> README.md
fi

awk -v img="<img src=\"${LOCAL_PATH}\" alt=\"GitHub Summary\" />" -v date="<!-- updated: ${DATE} -->" '
  /<!-- summary:start -->/ {
    print
    print img
    print date
    while (getline && $0 !~ /<!-- summary:end -->/);
    print "<!-- summary:end -->"
    next
  }
  { print }
' README.md > temp.md && mv temp.md README.md

git config user.name "$USERNAME"
git config user.email "$USERNAME@users.noreply.github.com"
git add "$LOCAL_PATH" README.md
git commit -m "chore: update summary SVG and timestamp comment"
git push
