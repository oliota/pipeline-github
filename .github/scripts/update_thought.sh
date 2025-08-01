#!/bin/bash
set -e

DATE=$(date +'%d/%m/%Y')
ENCODED_DATE=$(echo "$DATE" | sed 's|/|%2F|g')

for i in {1..10}; do
  DATA=$(curl -sf https://zenquotes.io/api/random) || continue
  QUOTE=$(echo "$DATA" | jq -r '.[0].q')
  AUTHOR=$(echo "$DATA" | jq -r '.[0].a')
  COMBINED="$DATE — $AUTHOR — $QUOTE"
  if [ ${#COMBINED} -le 160 ]; then
    BLOCK="<p><img src=\"https://img.shields.io/badge/${ENCODED_DATE}-Zen--Thought-blue\" alt=\"Date badge\" /></p>\n\n"
    BLOCK+="<table cellspacing=\"0\" cellpadding=\"12\" border=\"1\" style=\"border-collapse:separate; border-spacing:0; border:1px solid #ccc; width:100%;\">\n"
    BLOCK+="  <tr>\n"
    BLOCK+="    <td style=\"background:#f9f9f9; text-align:center;\">\n"
    BLOCK+="      &quot;${QUOTE}&quot;<br><strong>— ${AUTHOR}</strong>\n"
    BLOCK+="    </td>\n"
    BLOCK+="  </tr>\n"
    BLOCK+="</table>\n\n<br><br>"
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

# Só comita se houver mudanças
if ! git diff --cached --quiet; then
  git commit -m "chore: update daily zen thought"
  git push
else
  echo "No changes to commit."
fi
