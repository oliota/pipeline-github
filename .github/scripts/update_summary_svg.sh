#!/bin/bash
set -e

DATE=$(date +'%Y-%m-%d')
USERNAME="${GITHUB_ACTOR}"

SVG_URL="https://heroku-backend-nodejs-fd16668acdd6.herokuapp.com/api/v1/summary-svg?user=${USERNAME}&ts=${DATE}"

git clone "https://x-access-token:${GH_ALL_TOKEN}@github.com/${USERNAME}/${USERNAME}.git" profile-repo
cd profile-repo

if ! grep -q "<!-- summary:start -->" README.md; then
  echo -e "\n<!-- summary:start -->\n<!-- summary:end -->" >> README.md
fi

awk -v block="<img src=\"${SVG_URL}\" alt=\"GitHub Summary\" />" '
  /<!-- summary:start -->/ {
    print
    print block
    while (getline && $0 !~ /<!-- summary:end -->/);
    print "<!-- summary:end -->"
    next
  }
  { print }
' README.md > temp.md && mv temp.md README.md

git config user.name "$USERNAME"
git config user.email "$USERNAME@users.noreply.github.com"
git add README.md
git commit -m "chore: update summary SVG timestamp"
git push
