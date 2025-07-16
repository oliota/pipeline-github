#!/bin/bash
set -e

DATE=$(date +'%d/%m/%Y')

for i in {1..10}; do
  DATA=$(curl -sf https://zenquotes.io/api/random) || continue
  QUOTE=$(echo "$DATA" | jq -r '.[0].q')
  AUTHOR=$(echo "$DATA" | jq -r '.[0].a')
  COMBINED="$DATE — $AUTHOR — $QUOTE"

  if [ ${#COMBINED} -le 160 ]; then
    BLOCK="![Data](https://img.shields.io/badge/${DATE}-Zen--Thought-blue)\n\n\`\`\`txt\n\"${QUOTE}\"\n— ${AUTHOR}\n\`\`\`"
    break
  fi
done

[ -z "$BLOCK" ] && echo "No suitable quote found." && exit 1

git clone "https://x-access-token:${GH_ALL_TOKEN}@github.com/${GITHUB_ACTOR}/${GITHUB_ACTOR}.git" profile-repo
cd profile-repo

if ! grep -q "<!-- thought:start -->" README.md; then
  echo -e "\n<!-- thought:start -->\n<!-- thought:end -->" >> README.md
fi

awk -v block="$BLOCK" '
  /<!-- thought:start -->/ {
    print
    print block
    while (getline && $0 !~ /<!-- thought:end -->/);
    print "<!-- thought:end -->"
    next
  }
  { print }
' README.md > temp.md && mv temp.md README.md

git config user.name "$GITHUB_ACTOR"
git config user.email "$GITHUB_ACTOR@users.noreply.github.com"
git add README.md
git commit -m "chore: update daily zen thought"
git push
